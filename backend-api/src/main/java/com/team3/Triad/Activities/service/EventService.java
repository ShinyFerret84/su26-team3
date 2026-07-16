package com.team3.Triad.Activities.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.repository.EventRepository;

@Service
public class EventService {
    private final EventRepository eventRepository;

    public EventService(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    public List<Event> getAllEvents() {
        return eventRepository.findAll();
    }

    public Event getEventById(Long id) {
        return eventRepository.findById(id).orElse(null);
    }

    public Event createEvent(Event event) {
        return eventRepository.save(event);
    }

    public Event updateEvent(Long id, Event updatedEvent) {
        return eventRepository.findById(id)
                .map(event -> {
                    event.setEventName(updatedEvent.getEventName());
                    event.setVenueName(updatedEvent.getVenueName());
                    event.setStreetAddress(updatedEvent.getStreetAddress());
                    event.setCity(updatedEvent.getCity());
                    event.setState(updatedEvent.getState());
                    event.setZipCode(updatedEvent.getZipCode());
                    event.setPricePerPerson(updatedEvent.getPricePerPerson());
                    event.setDate(updatedEvent.getDate());
                    event.setStartTime(updatedEvent.getStartTime());
                    event.setEndTime(updatedEvent.getEndTime());
                    event.setMaxCapacity(updatedEvent.getMaxCapacity());
                    event.setDescription(updatedEvent.getDescription());
                    event.setImageUrl(updatedEvent.getImageUrl());
                    event.setCategory(updatedEvent.getCategory());
                    event.setIncluded(updatedEvent.getIncluded());
                    
                    return eventRepository.save(event);
                })
                .orElse(null);
    }

    public Event cancelEvent(Long id) {

        return eventRepository.findById(id)
                .map(event -> {
                    event.setCancelled(true);
                    return eventRepository.save(event);
                })
                .orElse(null);
    }

    public List<Event> searchEvents(String eventName, String category, String city, String state, LocalDate date) {
        if (eventName != null && !eventName.isEmpty()) {
            return eventRepository.findByEventNameContainingIgnoreCase(eventName);
        } else if (category != null && !category.isEmpty()) {
            return eventRepository.findByCategoryContainingIgnoreCase(category);
        } else if (city != null && !city.isEmpty()) {
            return eventRepository.findByCityContainingIgnoreCase(city);
        } else if (state != null && !state.isEmpty()) {
            return eventRepository.findByStateContainingIgnoreCase(state);
        } else if (date != null) {
            return eventRepository.findByDate(date);
        } else {
            return getAllEvents();
        }
    }

    public List<Event> getAvailableUpcomingEvents() {

    return eventRepository
        .findByCancelledFalseAndDateGreaterThanEqualOrderByDateAsc(
            LocalDate.now());
    }

    public List<Event> getEventsByProviderId(Long providerId) {
        return eventRepository.findByProviderId(providerId);
    }

    // User story 2: Get events that match customer's interests
    public List<Event> getEventsByInterests(List<String> interests) {
        // If customer has no interests, show all events
        if (interests == null || interests.isEmpty()) {
            return eventRepository.findAll();
        }
        // Find events where category matches any interest
        return eventRepository.findByCategoryIn(interests);
    }
    
}