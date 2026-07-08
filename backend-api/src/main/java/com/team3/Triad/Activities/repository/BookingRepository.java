package com.team3.Triad.Activities.repository;

import com.team3.Triad.Activities.entity.Booking;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface BookingRepository extends JpaRepository<Booking, Long> {

    // Get all bookings for a customer (used in My Plans)
    List<Booking> findByCustomerId(Long customerId);

    // Get bookings by status for a customer (used for Upcoming, Past, Cancelled tabs)
    List<Booking> findByCustomerIdAndStatus(Long customerId, String status);

    // Get bookings for a specific event
    List<Booking> findByEventId(Long eventId);
}
