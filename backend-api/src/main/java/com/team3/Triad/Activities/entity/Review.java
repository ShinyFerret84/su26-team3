package com.team3.Triad.Activities.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "reviews")
public class Review {

    // Pimary key to auto-generated ID for each review
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Rating from 1 to 5 stars
    private Integer rating;

    // The text review
    @Column(length = 1000)
    private String comment;

    // When the review was written
    @Column(name = "review_date")
    private String reviewDate;

    // Many reviews belong to one customer
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    // Many reviews belong to one event
    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    // Empty constructor 
    public Review() {}

    // Constructor to create a new review
    public Review(Integer rating, String comment, Customer customer, Event event) {
        this.rating = rating;
        this.comment = comment;
        this.customer = customer;
        this.event = event;
    }

    // Getters and setters to access and modify the values
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getRating() { return rating; }
    public void setRating(Integer rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getReviewDate() { return reviewDate; }
    public void setReviewDate(String reviewDate) { this.reviewDate = reviewDate; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public Event getEvent() { return event; }
    public void setEvent(Event event) { this.event = event; }

    //Provider can reply to reviews
    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    @Column(length = 1000)
    private String providerReply;

    @Column(name = "reply_date")
    private String replyDate;

    //Provider reply getters and setters
    public Provider getProvider() { return provider; }

    public void setProvider(Provider provider) { this.provider = provider; }
    
    public String getProviderReply() { return providerReply; }

    public void setProviderReply(String providerReply) { this.providerReply = providerReply; }

    public String getReplyDate() { return replyDate; }

    public void setReplyDate(String replyDate) { this.replyDate = replyDate; }
}