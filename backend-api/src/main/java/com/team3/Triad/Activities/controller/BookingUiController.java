package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.service.BookingService;
import com.team3.Triad.Activities.service.CustomerManager;
import com.team3.Triad.Activities.service.EventService;
import com.team3.Triad.Activities.service.ProviderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.team3.Triad.Activities.entity.Review;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/providers/{providerId}")
public class BookingUiController {

    @Autowired
    private BookingService bookingService;

    @Autowired
    private ProviderService providerService;

    @Autowired
    private EventService eventService;

    @Autowired
    private CustomerManager customerManager;

    // PROVIDER BOOKING MANAGEMENT
    // Show all bookings for a provider
    @GetMapping("/bookings")
    public String showProviderBookings(@PathVariable Long providerId, Model model) {
        Provider provider = providerService.getProviderById(providerId);
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        model.addAttribute("provider", provider);
        model.addAttribute("bookings", bookingService.getBookingsByProviderId(providerId));
        return "provider/bookings";
    }

    // Show booking details for a provider
    @GetMapping("/bookings/{bookingId}")
    public String showBookingDetail(@PathVariable Long providerId,
                                    @PathVariable Long bookingId,
                                    Model model) {
        Provider provider = providerService.getProviderById(providerId);
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null || !booking.getEvent().getProvider().getId().equals(providerId)) {
            return "redirect:/providers/" + providerId + "/bookings";
        }

        model.addAttribute("provider", provider);
        model.addAttribute("booking", booking);
        return "provider/booking-detail";
    }

    // Confirm booking from provider view
    @PostMapping("/bookings/{bookingId}/confirm")
    public String confirmBooking(@PathVariable Long providerId,
                                 @PathVariable Long bookingId,
                                 Model model) {
        Provider provider = providerService.getProviderById(providerId);
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        Booking booking = bookingService.getBookingById(bookingId);
        if (booking != null && booking.getEvent().getProvider().getId().equals(providerId)) {
            booking.setStatus("CONFIRMED");
            bookingService.saveBooking(booking);
        }

        return "redirect:/providers/" + providerId + "/bookings/" + bookingId;
    }

    // Cancel booking from provider view
    @PostMapping("/bookings/{bookingId}/cancel")
    public String cancelBooking(@PathVariable Long providerId,
                                @PathVariable Long bookingId,
                                Model model) {
        Provider provider = providerService.getProviderById(providerId);
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        Booking booking = bookingService.getBookingById(bookingId);
        if (booking != null && booking.getEvent().getProvider().getId().equals(providerId)) {
            booking.setStatus("CANCELLED");
            bookingService.saveBooking(booking);
        }

        return "redirect:/providers/" + providerId + "/bookings/" + bookingId;
    }

    // USER STORY 3: CUSTOMER BOOKING PAGE
    // URL: http://localhost:8080/customer/booking/{eventId}
    @GetMapping("/customer/booking/{eventId}")
    public String showCustomerBookingForm(@PathVariable Long eventId,
                                          @RequestParam(required = false) Long customerId,
                                          Model model) {
        Event event = eventService.getEventById(eventId);
        if (event == null) {
            return "error/404";
        }

        // Default to customer ID 1 if not provided (for demo)
        if (customerId == null) {
            customerId = 1L;
        }

        Customer customer = customerManager.getCustomerById(customerId).orElse(null);
        if (customer == null) {
            return "error/404";
        }

        model.addAttribute("event", event);
        model.addAttribute("customer", customer);
        return "customer/booking";
    }

    // USER STORY 3: CONFIRM CUSTOMER BOOKING
    // URL: POST /customer/booking/confirm
    @PostMapping("/customer/booking/confirm")
    public String confirmCustomerBooking(@RequestParam Long customerId,
                                         @RequestParam Long eventId,
                                         @RequestParam Integer numberOfPeople,
                                         @RequestParam(required = false) String specialRequests,
                                         Model model) {
        try {
            Booking booking = customerManager.bookEvent(customerId, eventId, numberOfPeople, specialRequests);
            model.addAttribute("booking", booking);
            model.addAttribute("message", "Booking confirmed successfully!");
            return "customer/booking-confirmation";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "customer/booking-error";
        }
    }

    // USER STORY 4: CUSTOMER REVIEW FORM PAGE
    // URL: http://localhost:8080/customer/review/{bookingId}
    @GetMapping("/customer/review/{bookingId}")
    public String showCustomerReviewForm(@PathVariable Long bookingId,
                                         @RequestParam(required = false) Long customerId,
                                         Model model) {
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
            return "error/404";
        }

        // Default to customer ID 1 if not provided (for demo)
        if (customerId == null) {
            customerId = 1L;
        }

        Customer customer = customerManager.getCustomerById(customerId).orElse(null);
        if (customer == null) {
            return "error/404";
        }

        model.addAttribute("customer", customer);
        model.addAttribute("event", booking.getEvent());
        model.addAttribute("bookingId", bookingId);
        return "customer/review-form";
    }

    // USER STORY 4: SUBMIT CUSTOMER REVIEW
    // URL: POST /customer/review/submit
    @PostMapping("/customer/review/submit")
    public String submitCustomerReview(@RequestParam Long customerId,
                                       @RequestParam Long eventId,
                                       @RequestParam Integer rating,
                                       @RequestParam String comment,
                                       Model model) {
        try {
            com.team3.Triad.Activities.entity.Review review = customerManager.addReview(
                    customerId, eventId, rating, comment);
            model.addAttribute("review", review);
            model.addAttribute("message", "Review submitted successfully!");
            return "customer/review-confirmation";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "customer/review-error";
        }
    }

}