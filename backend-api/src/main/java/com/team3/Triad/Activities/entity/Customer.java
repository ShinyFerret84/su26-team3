package com.team3.Triad.Activities.entity;

import jakarta.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "customers")
public class Customer {
    // @Id is the unique ID for each customer
    // @GeneratedValue the database will auto generate this number 
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // @Column this field cannot be empty 
    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    // Unique = true means no two customers can have the same email
    @Column(unique = true, nullable = false)
    private String email;

    private String password;

    private String location;

    // NEW: Changed from single String to List for multiple interests
    // NEW: @ElementCollection creates a separate table for interests
    // NEW: Each interest is stored as a separate row in customer_interests table
    @ElementCollection
    @CollectionTable(name = "customer_interests", 
                     joinColumns = @JoinColumn(name = "customer_id"))
    @Column(name = "interest_tag")
    private List<String> interests = new ArrayList<>();

    @Column(name = "member_since")
    private String memberSince;

    // One customer can have many bookings (list of events they booked)
    // MappedBy = customer means the Booking.java file has the customer field
    // CascadeType.ALL = if you delete a customer, delete their bookings too
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Booking> bookings = new ArrayList<>();

    // One customer can have many reviews they wrote
    @OneToMany(mappedBy = "customer", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Review> reviews = new ArrayList<>();

    // Constructors
    public Customer() {}

    // Constructor to create a new customer with basic info
    // NEW: Changed parameter from String interests to List<String> interests
    public Customer(String firstName, String lastName, String email, String location, List<String> interests) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.location = location;
        this.interests = interests != null ? interests : new ArrayList<>();
    }

    // Getters and Setters set it to that value
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    // Changed return type from String to List<String>
    public List<String> getInterests() {
        return interests;
    }

    // Changed parameter from String to List<String>
    public void setInterests(List<String> interests) {
        this.interests = interests != null ? interests : new ArrayList<>();
    }

    // Helper method to add a single interest (prevents duplicates)
    public void addInterest(String interest) {
        if (interest != null && !interest.trim().isEmpty() && !this.interests.contains(interest.trim())) {
            this.interests.add(interest.trim());
        }
    }

    // Helper method to remove a single interest
    public void removeInterest(String interest) {
        if (interest != null) {
            this.interests.remove(interest.trim());
        }
    }

    public String getMemberSince() {
        return memberSince;
    }

    public void setMemberSince(String memberSince) {
        this.memberSince = memberSince;
    }

    public List<Booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<Booking> bookings) {
        this.bookings = bookings;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }
}