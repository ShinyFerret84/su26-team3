package com.team3.Triad.Activities.dto;

public record ProviderStatistics(
    Long totalEventsHosted,
    Long upcomingEvents,
    Long completedEvents,
    Long cancelledEvents,
    Long totalAttendees,
    Long totalReviews,
    Double averageRating,
    Double totalRevenue
) {}
