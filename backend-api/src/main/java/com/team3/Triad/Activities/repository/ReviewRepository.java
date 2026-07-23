package com.team3.Triad.Activities.repository;

import com.team3.Triad.Activities.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {

    // Get all reviews by a customer (used in Profile page)
    List<Review> findByCustomerId(Long customerId);

    // Get all reviews for an event (used in Booking page)
    List<Review> findByEventId(Long eventId);

    // Get reviews by rating (for filtering)
    List<Review> findByRating(Integer rating);

    // Get reviews by event and rating
    List<Review> findByEventIdAndRating(Long eventId, Integer rating);

    //For Provider Replies
    //Find Reviews by Event
    List<Review> findByEventProviderId(Long providerId);

}