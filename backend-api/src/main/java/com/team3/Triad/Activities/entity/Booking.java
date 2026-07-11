package com.team3.Triad.Activities.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "bookings")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
 
    // How many people are attending 
    @Column(name = "number_of_people", nullable = false)
    private Integer numberOfPeople;

   // Total price  
    @Column(name = "total_price", nullable = false)
    private Double totalPrice;
   
    // Special requests from the customer
    @Column(name = "special_requests")
    private String specialRequests;

    // Booking status (confirmed, past, cancelled)
    private String status;

    // Date the booking was made
    @Column(name = "booking_date")
    private String bookingDate;

    // Many bookings belong to ONE customer
    // This creates a FOREIGN KEY column called customer_id
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    // Many bookings belong to ONE event
    @ManyToOne
    @JoinColumn(name = "event_id")
    private Event event;

    public Booking() {}

    // Constructor to create new booking
    public Booking(Integer numberOfPeople, Double totalPrice, Customer customer, Event event) {
        this.numberOfPeople = numberOfPeople;
        this.totalPrice = totalPrice;
        this.customer = customer;
        this.event = event;
        this.status = "CONFIRMED";
    }

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Integer getNumberOfPeople() { return numberOfPeople; }
    public void setNumberOfPeople(Integer numberOfPeople) { this.numberOfPeople = numberOfPeople; }

    public Double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(Double totalPrice) { this.totalPrice = totalPrice; }

    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getBookingDate() { return bookingDate; }
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }

    public Customer getCustomer() { return customer; }
    public void setCustomer(Customer customer) { this.customer = customer; }

    public Event getEvent() { return event; }
    public void setEvent(Event event) { this.event = event; }
}