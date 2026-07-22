package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.repository.BookingRepository;
import com.team3.Triad.Activities.service.CustomerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerUiController {

    @Autowired
    private CustomerManager customerManager;

    @Autowired
    private BookingRepository bookingRepository;

    // USER 1 story: Show customer profile page with their interests
    // Link after running spring-boot:http://localhost:8080/customer/profile/1

    @GetMapping("/profile/{id}")
    public String viewProfile(@PathVariable Long id, Model model) {
        
        // Get customer from database by ID
        Optional<Customer> customerOpt = customerManager.getCustomerById(id);
        
        // If customer exists show their profile
        if (customerOpt.isPresent()) {
            Customer customer = customerOpt.get();
            
            // Send customer data to the HTML template
            model.addAttribute("customer", customer);
            model.addAttribute("firstName", customer.getFirstName());
            model.addAttribute("lastName", customer.getLastName());
            model.addAttribute("email", customer.getEmail());
            model.addAttribute("location", customer.getLocation());
            model.addAttribute("memberSince", customer.getMemberSince());
            model.addAttribute("interests", customer.getInterests());
            
            // Make initials for avatar
            String initials = "";
            if (customer.getFirstName() != null && !customer.getFirstName().isEmpty()) {
                initials += customer.getFirstName().charAt(0);
            }
            if (customer.getLastName() != null && !customer.getLastName().isEmpty()) {
                initials += customer.getLastName().charAt(0);
            }
            model.addAttribute("initials", initials.toUpperCase());
            
            // Statistics to display
            model.addAttribute("activitiesDone", 12);
            model.addAttribute("reviewsWritten", 8);
            model.addAttribute("interestsCount", 
                customer.getInterests() != null ? customer.getInterests().size() : 0);
            
            // Load the profile.ftlh template
            return "customer/profile";
            
        } else {
            // Customer not found  show error page
            return "error/404";
        }
    }

    @GetMapping("/test")
    public String testPage() {
        return "customer/test";
    }

    // USER 3: My Plans Page - Shows customer's bookings
    // URL: http://localhost:8080/customer/myplans/1
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

}