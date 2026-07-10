package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.dto.LoginRequest;
import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Review;
import com.team3.Triad.Activities.service.CustomerManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/customers")
@CrossOrigin(origins = "*")
public class CustomerController {

    @Autowired
    private CustomerManager customerManager;

    // create a new customer
    @PostMapping("/register")
    public ResponseEntity<?> createCustomer(@RequestBody Customer customer) {
        try {
            Customer created = customerManager.createCustomer(customer);
            return ResponseEntity.status(HttpStatus.CREATED).body(created);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    // Customer login
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest) {
        Optional<Customer> customer = customerManager.getCustomerByEmail(loginRequest.getEmail());
        if (customer.isPresent() && customer.get().getPassword().equals(loginRequest.getPassword())) {
            return ResponseEntity.ok(customer.get());
        }
        Map<String, String> error = new HashMap<>();
        error.put("error", "Invalid email or password");
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(error);
    }

    // Get all customers
    @GetMapping
    public ResponseEntity<List<Customer>> getAllCustomers() {
        return ResponseEntity.ok(customerManager.getAllCustomers());
    }

    // Get customer by ID
    @GetMapping("/{id}")
    public ResponseEntity<?> getCustomerById(@PathVariable Long id) {
        return customerManager.getCustomerById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Get customer by email
    @GetMapping("/email/{email}")
    public ResponseEntity<?> getCustomerByEmail(@PathVariable String email) {
        return customerManager.getCustomerByEmail(email)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // Update customer
    @PutMapping("/{id}")
    public ResponseEntity<?> updateCustomer(@PathVariable Long id, @RequestBody Customer customerDetails) {
        try {
            Customer updated = customerManager.updateCustomer(id, customerDetails);
            return ResponseEntity.ok(updated);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.notFound().build();
        }
    }

    // Delete customer
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteCustomer(@PathVariable Long id) {
        try {
            customerManager.deleteCustomer(id);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Customer deleted successfully");
            return ResponseEntity.ok(response);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Book an event
    @PostMapping("/{customerId}/bookings")
    public ResponseEntity<?> bookEvent(
            @PathVariable Long customerId,
            @RequestBody Booking bookingRequest) {
        try {
            Booking booking = customerManager.bookEvent(
                    customerId,
                    bookingRequest.getEvent().getId(),
                    bookingRequest.getNumberOfPeople(),
                    bookingRequest.getSpecialRequests()
            );
            return ResponseEntity.status(HttpStatus.CREATED).body(booking);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    // Get all bookings for a customer
    @GetMapping("/{customerId}/bookings")
    public ResponseEntity<?> getCustomerBookings(@PathVariable Long customerId) {
        try {
            List<Booking> bookings = customerManager.getCustomerBookings(customerId);
            return ResponseEntity.ok(bookings);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Get bookings by status
    @GetMapping("/{customerId}/bookings/status/{status}")
    public ResponseEntity<?> getCustomerBookingsByStatus(
            @PathVariable Long customerId,
            @PathVariable String status) {
        try {
            List<Booking> bookings = customerManager.getCustomerBookingsByStatus(customerId, status);
            return ResponseEntity.ok(bookings);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Cancel a booking
    @PutMapping("/bookings/{bookingId}/cancel")
    public ResponseEntity<?> cancelBooking(@PathVariable Long bookingId) {
        try {
            Booking cancelled = customerManager.cancelBooking(bookingId);
            return ResponseEntity.ok(cancelled);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    // Add a review
    @PostMapping("/{customerId}/reviews")
    public ResponseEntity<?> addReview(
            @PathVariable Long customerId,
            @RequestBody Review reviewRequest) {
        try {
            Review review = customerManager.addReview(
                    customerId,
                    reviewRequest.getEvent().getId(),
                    reviewRequest.getRating(),
                    reviewRequest.getComment()
            );
            return ResponseEntity.status(HttpStatus.CREATED).body(review);
        } catch (RuntimeException e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }

    // Get all reviews by a customer
    @GetMapping("/{customerId}/reviews")
    public ResponseEntity<?> getCustomerReviews(@PathVariable Long customerId) {
        try {
            List<Review> reviews = customerManager.getCustomerReviews(customerId);
            return ResponseEntity.ok(reviews);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }
}