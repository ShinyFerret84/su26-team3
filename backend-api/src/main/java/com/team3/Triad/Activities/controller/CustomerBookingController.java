package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Review;
import com.team3.Triad.Activities.repository.BookingRepository;
import com.team3.Triad.Activities.service.CustomerManager;
import com.team3.Triad.Activities.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerBookingController {

    @Autowired
    private EventService eventService;

    @Autowired
    private CustomerManager customerManager;

    @Autowired
    private BookingRepository bookingRepository;

    // USER 3: My Plans Page
    @GetMapping("/myplans/{id}")
    public String viewMyPlans(@PathVariable Long id, Model model) {
        Optional<Customer> customerOpt = customerManager.getCustomerById(id);
        if (customerOpt.isEmpty()) {
            return "error/404";
        }

        Customer customer = customerOpt.get();
        List<Booking> bookings = bookingRepository.findByCustomerId(id);

        model.addAttribute("customer", customer);
        model.addAttribute("bookings", bookings);

        return "customer/myPlans";
    }

    // USER 3: Booking Form Page
    @GetMapping("/booking/{eventId}")
    public String showBookingForm(@PathVariable Long eventId,
                                  @RequestParam(required = false) Long customerId,
                                  Model model) {
        Event event = eventService.getEventById(eventId);
        if (event == null) {
            return "error/404";
        }

        if (customerId == null) {
            customerId = 1L;
        }

        Optional<Customer> customerOpt = customerManager.getCustomerById(customerId);
        if (customerOpt.isEmpty()) {
            return "error/404";
        }

        model.addAttribute("event", event);
        model.addAttribute("customer", customerOpt.get());

        return "customer/booking";
    }

    // USER 3: Confirm Booking
    @PostMapping("/booking/confirm")
    public String confirmBooking(@RequestParam Long customerId,
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

    // USER 4: Review Form Page
    @GetMapping("/review/{bookingId}")
    public String showReviewForm(@PathVariable Long bookingId,
                                 @RequestParam(required = false) Long customerId,
                                 Model model) {
        Optional<Booking> bookingOpt = bookingRepository.findById(bookingId);
        if (bookingOpt.isEmpty()) {
            return "error/404";
        }

        Booking booking = bookingOpt.get();

        if (customerId == null) {
            customerId = 1L;
        }

        Optional<Customer> customerOpt = customerManager.getCustomerById(customerId);
        if (customerOpt.isEmpty()) {
            return "error/404";
        }

        model.addAttribute("customer", customerOpt.get());
        model.addAttribute("event", booking.getEvent());
        model.addAttribute("bookingId", bookingId);

        return "customer/review-form";
    }

    // USER 4: Submit Review - Redirects to Profile Page
    @PostMapping("/review/submit")
    public String submitReview(@RequestParam Long customerId,
                               @RequestParam Long eventId,
                               @RequestParam Integer rating,
                               @RequestParam String comment,
                               Model model) {
        try {
            Review review = customerManager.addReview(customerId, eventId, rating, comment);
            model.addAttribute("review", review);
            model.addAttribute("message", "Review submitted successfully!");
            // Redirect to customer profile page
            return "redirect:/customer/profile/" + customerId;
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("customerId", customerId);
            return "customer/review-error";
        }
    }

    // Cancel Booking
    @PostMapping("/booking/cancel")
    public String cancelBooking(@RequestParam Long bookingId,
                                @RequestParam Long customerId,
                                Model model) {
        try {
            Optional<Booking> bookingOpt = bookingRepository.findById(bookingId);
            if (bookingOpt.isPresent()) {
                Booking booking = bookingOpt.get();
                booking.setStatus("CANCELLED");
                bookingRepository.save(booking);
            }
            return "redirect:/customer/myplans/" + customerId;
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "customer/booking-error";
        }
    }
}