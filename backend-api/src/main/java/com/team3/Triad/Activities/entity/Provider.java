package com.team3.Triad.Activities.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "providers")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Provider {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    //Contact Information
    @Column(nullable = false)
    private String firstName;

    @Column(nullable = false)
    private String lastName;

    @Column(nullable = false)
    private String email;

    @Column
    private String phoneNumber;

    //Business Information
    @Column(nullable = false)
    private String companyName;

    @Column(nullable = false)
    private String category;

    @Column
    private String website;

    @Column(length = 1000)
    private String description;

    //Account Information
    @Column(nullable = false)
    private String password;

    @Column(nullable = false) //This allows for a "soft delete" that doesn't actually remove the provider profile from the database
    private Boolean active = true;

    //Account Creation Date
    @Column(nullable = false)
    private LocalDate memberSince = LocalDate.now();

    //Provider -> Event Relationship
    @JsonIgnore
    @OneToMany(mappedBy = "provider")
    private List<Event> events = new ArrayList<>();

    public void addEvent(Event event) {
        events.add(event);
        event.setProvider(this);
    }

    public void removeEvent(Event event) {
        events.remove(event);
        event.setProvider(null);
    }

    @OneToMany(mappedBy = "provider")
    @JsonIgnore
    private List<Review> reviews = new ArrayList<>();

}
