package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.service.CustomerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerUiController {

    @Autowired
    private CustomerManager customerManager;

    // USER 1 story: Show customer profile page with their interests
    // URL: http://localhost:8080/customer/profile/1
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
}