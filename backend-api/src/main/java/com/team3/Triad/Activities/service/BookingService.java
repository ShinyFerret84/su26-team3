package com.team3.Triad.Activities.service;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.repository.BookingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookingService {

    @Autowired
    private BookingRepository bookingRepository;

    // Get all bookings for a provider
    public List<Booking> getBookingsByProviderId(Long providerId) {
        return bookingRepository.findByEventProviderId(providerId);
    }

    // Get booking by ID
    public Booking getBookingById(Long id) {
        return bookingRepository.findById(id).orElse(null);
    }

    // Save a booking
    public Booking saveBooking(Booking booking) {
        return bookingRepository.save(booking);
    }

    // Get all bookings for a customer
    public List<Booking> getBookingsByCustomerId(Long customerId) {
        return bookingRepository.findByCustomerId(customerId);
    }

    // Get bookings by customer and status
    public List<Booking> getBookingsByCustomerIdAndStatus(Long customerId, String status) {
        return bookingRepository.findByCustomerIdAndStatus(customerId, status);
    }

    // Get bookings for a specific event
    public List<Booking> getBookingsByEventId(Long eventId) {
        return bookingRepository.findByEventId(eventId);
    }
}