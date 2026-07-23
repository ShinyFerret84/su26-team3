package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.service.CustomerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Optional;

@Controller
public class LoginController {

    @Autowired
    private CustomerManager customerManager;

    // SHOW LOGIN PAGE
    // URL: http://localhost:8080/customer/login
    @GetMapping("/customer/login")
    public String showLoginPage() {
        return "customer/login";
    }

    // HANDLE LOGIN
    // URL: POST /customer/login
    @PostMapping("/customer/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        Model model) {
        Optional<Customer> customerOpt = customerManager.getCustomerByEmail(email);
        
        if (customerOpt.isPresent()) {
            Customer customer = customerOpt.get();
            if (customer.getPassword().equals(password)) {
                // Login successful - redirect to profile
                return "redirect:/customer/profile/" + customer.getId();
            }
        }
        
        // Login failed
        model.addAttribute("error", "Invalid email or password. Please try again.");
        model.addAttribute("email", email);
        return "customer/login";
    }

    // SHOW SIGNUP PAGE
    // URL: http://localhost:8080/customer/signup
    @GetMapping("/customer/signup")
    public String showSignUpPage() {
        return "customer/signup";
    }

    // HANDLE SIGNUP
    // URL: POST /customer/signup
    @PostMapping("/customer/signup")
    public String signUp(@RequestParam String firstName,
                         @RequestParam String lastName,
                         @RequestParam String email,
                         @RequestParam String location,
                         @RequestParam String password,
                         Model model) {
        try {
            Customer customer = new Customer();
            customer.setFirstName(firstName);
            customer.setLastName(lastName);
            customer.setEmail(email);
            customer.setLocation(location);
            customer.setPassword(password);
            
            // Create the customer (variable removed to fix warning)
            customerManager.createCustomer(customer);
            model.addAttribute("success", "Account created successfully! Please log in.");
            return "customer/login";
        } catch (RuntimeException e) {
            model.addAttribute("error", e.getMessage());
            return "customer/signup";
        }
    }

    // LOGOUT - Redirect to home page
    // URL: GET /customer/logout
    @GetMapping("/customer/logout")
    public String logout() {
        // Redirect to home page
        return "redirect:/";
    }
}