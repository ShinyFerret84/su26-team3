package com.team3.Triad.Activities.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team3.Triad.Activities.entity.Booking;
import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.repository.BookingRepository;
import com.team3.Triad.Activities.repository.EventRepository;
import com.team3.Triad.Activities.repository.ProviderRepository;
import com.team3.Triad.Activities.entity.Review;
import com.team3.Triad.Activities.repository.ReviewRepository;
import com.team3.Triad.Activities.dto.ProviderStatistics;

@Service
public class ProviderService {
    private final ProviderRepository providerRepository;
    private final ReviewRepository reviewRepository;
    private final BookingRepository bookingRepository;
    private final EventRepository eventRepository;

    public ProviderService(
        ProviderRepository providerRepository,
        EventRepository eventRepository,
        BookingRepository bookingRepository,
        ReviewRepository reviewRepository) {

    this.providerRepository = providerRepository;
    this.eventRepository = eventRepository;
    this.bookingRepository = bookingRepository;
    this.reviewRepository = reviewRepository;
}

    //GET all providers
    public List<Provider> getAllProviders() {
        return providerRepository.findByActiveTrue();
    }

    //GET provider by ID
    //Used for event history
    public Provider getProviderById(Long id) {
        return providerRepository.findById(id).orElse(null);
    }

    //Used to create new events and provider search
    public Provider getActiveProviderById(Long id) {
    return providerRepository.findById(id)
            .filter(Provider::getActive)
            .orElse(null);
}

    //CREATE provider
    public Provider createProvider(Provider provider) {
        provider.setMemberSince(LocalDate.now());
        provider.setActive(true);
        return providerRepository.save(provider);
    }

    //UPDATE provider
    public Provider updateProvider(Long id, Provider providerDetails) {
        return providerRepository.findById(id)
                .map(provider -> {

                    provider.setFirstName(providerDetails.getFirstName());
                    provider.setLastName(providerDetails.getLastName());
                    provider.setEmail(providerDetails.getEmail());
                    provider.setPhoneNumber(providerDetails.getPhoneNumber());

                    provider.setCompanyName(providerDetails.getCompanyName());
                    provider.setCategory(providerDetails.getCategory());
                    provider.setWebsite(providerDetails.getWebsite());
                    provider.setDescription(providerDetails.getDescription());

                    if (providerDetails.getPassword() != null
                        && !providerDetails.getPassword().isBlank()) {

                    provider.setPassword(
                            providerDetails.getPassword());
                    }

                    return providerRepository.save(provider);
                })
                .orElse(null);
    }

    //DELETE provider
    public void deleteProvider(Long id) {
        Provider provider = providerRepository.findById(id).orElse(null);
        if (provider != null) {
            provider.setActive(false);
            providerRepository.save(provider);
        }
        
    }

    //Provider replies to reviews
    public List<Review> getProviderReviews(Long providerId) {
    return reviewRepository.findByEventProviderId(providerId);
    }

    public Review replyToReview(Long reviewId, String reply) {
        Review review = reviewRepository.findById(reviewId)
            .orElseThrow(() -> new RuntimeException("Review not found"));

        review.setProviderReply(reply);
        review.setReplyDate(LocalDate.now().toString());

        return reviewRepository.save(review);
    }

    //Provider Statistics
    public ProviderStatistics getProviderStatistics(Long providerId) {
        Long totalEvents = eventRepository.countByProviderId(providerId);
        List<Booking> bookings = bookingRepository.findByEventProviderId(providerId);
        Long totalAttendees = bookings.stream().mapToLong(Booking::getNumberOfPeople).sum();
        Double totalRevenue = bookings.stream().mapToDouble(Booking::getTotalPrice).sum();
        List<Review> reviews = reviewRepository.findByEventProviderId(providerId);
        Long totalReviews = (long) reviews.size();
        Double averageRating;
        if (reviews.isEmpty()) {
            averageRating = 0.0;
        } else {
            averageRating = reviews.stream().mapToInt(Review::getRating).average().orElse(0.0);
        }

        return new ProviderStatistics(
        totalEvents,
        totalAttendees,
        totalReviews,
        averageRating,
        totalRevenue
        );
    }

}

