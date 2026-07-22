package com.team3.Triad.Activities.service;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Review;
import com.team3.Triad.Activities.repository.BookingRepository;
import com.team3.Triad.Activities.repository.CustomerRepository;
import com.team3.Triad.Activities.repository.EventRepository;
import com.team3.Triad.Activities.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class CustomerManager {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private BookingRepository bookingRepository;

    @Autowired
    private ReviewRepository reviewRepository;

    public Customer createCustomer(Customer customer) {
        if (customerRepository.existsByEmail(customer.getEmail())) {
            throw new RuntimeException("Email already exists");
        }
        customer.setMemberSince(LocalDate.now().toString());
        return customerRepository.save(customer);
    }

    public List<Customer> getAllCustomers() {
        return customerRepository.findAll();
    }

    public Optional<Customer> getCustomerById(Long id) {
        return customerRepository.findById(id);
    }

    public Optional<Customer> getCustomerByEmail(String email) {
        return customerRepository.findByEmail(email);
    }

    public Customer updateCustomer(Long id, Customer customerDetails) {
        Customer customer = customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        customer.setFirstName(customerDetails.getFirstName());
        customer.setLastName(customerDetails.getLastName());
        customer.setEmail(customerDetails.getEmail());
        customer.setLocation(customerDetails.getLocation());
        customer.setInterests(customerDetails.getInterests());
        customer.setPassword(customerDetails.getPassword());
        return customerRepository.save(customer);
    }

    public void deleteCustomer(Long id) {
        if (!customerRepository.existsById(id)) {
            throw new RuntimeException("Customer not found");
        }
        customerRepository.deleteById(id);
    }

    public Booking bookEvent(Long customerId, Long eventId, Integer numberOfPeople, String specialRequests) {
        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new RuntimeException("Event not found"));
        Booking booking = new Booking();
        booking.setCustomer(customer);
        booking.setEvent(event);
        booking.setNumberOfPeople(numberOfPeople);
        booking.setSpecialRequests(specialRequests);
        booking.setStatus("CONFIRMED");
        booking.setBookingDate(LocalDate.now().toString());
        if (numberOfPeople != null && event.getPricePerPerson() != null) {
            booking.setTotalPrice(numberOfPeople * event.getPricePerPerson());
        }
        return bookingRepository.save(booking);
    }

    public List<Booking> getCustomerBookings(Long customerId) {
        if (!customerRepository.existsById(customerId)) {
            throw new RuntimeException("Customer not found");
        }
        return bookingRepository.findByCustomerId(customerId);
    }

    public List<Booking> getCustomerBookingsByStatus(Long customerId, String status) {
        if (!customerRepository.existsById(customerId)) {
            throw new RuntimeException("Customer not found");
        }
        return bookingRepository.findByCustomerIdAndStatus(customerId, status);
    }

    public Booking cancelBooking(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));
        booking.setStatus("CANCELLED");
        return bookingRepository.save(booking);
    }

    public Review addReview(Long customerId, Long eventId, Integer rating, String comment) {
        Customer customer = customerRepository.findById(customerId)
                .orElseThrow(() -> new RuntimeException("Customer not found"));
        Event event = eventRepository.findById(eventId)
                .orElseThrow(() -> new RuntimeException("Event not found"));
        
        // Attendance check for testing User story 4
        Review review = new Review();
        review.setCustomer(customer);
        review.setEvent(event);
        review.setProvider(event.getProvider());
        review.setRating(rating);
        review.setComment(comment);
        review.setReviewDate(LocalDate.now().toString());
        return reviewRepository.save(review);
    }

    public List<Review> getCustomerReviews(Long customerId) {
        if (!customerRepository.existsById(customerId)) {
            throw new RuntimeException("Customer not found");
        }
        return reviewRepository.findByCustomerId(customerId);
    }

    // USER Story 1: Interest Profile Management Save Customer
    public Customer saveCustomer(Customer customer) {
        return customerRepository.save(customer);
    }
}