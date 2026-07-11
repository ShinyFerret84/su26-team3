package com.team3.Triad.Activities.dto;

public record ProviderStatistics(
    Long totalEventsHosted,
    Long totalAttendees,
    Long totalReviews,
    Double averageRating,
    Double totalRevenue
) {}
