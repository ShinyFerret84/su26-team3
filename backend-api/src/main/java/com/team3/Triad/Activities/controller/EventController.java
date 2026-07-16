package com.team3.Triad.Activities.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.service.EventService;

@RestController
@RequestMapping("/api/events")
@CrossOrigin(origins = "*")
public class EventController {
    private final EventService eventService;

    public EventController(EventService eventService){
        this.eventService = eventService;
    }

    //GET all events
    @GetMapping
    public List<Event> getAllEvents(){
        return eventService.getAllEvents();
    }

    //GET event by ID
    @GetMapping("/{id}")
    public Event getEventById(@PathVariable Long id) {
        return eventService.getEventById(id);
    }

    // CREATE event
    @PostMapping
    public Event createEvent(@RequestBody Event event) {
        return eventService.createEvent(event);
    }

    //UPDATE event
    @PutMapping("/{id}")
    public Event updateEvent(
            @PathVariable Long id,
            @RequestBody Event event) {

        return eventService.updateEvent(id, event);
    }

    //DELETE event (really cancel, event stays in database but not active)
    @PutMapping("/{id}/cancel")
    public Event cancelEvent(@PathVariable Long id) {
        return eventService.cancelEvent(id);
}

    // SEARCH events
    @GetMapping("/search")
    public List<Event> searchEvents(

            @RequestParam(required = false) String eventName,

            @RequestParam(required = false) String category,

            @RequestParam(required = false) String city,

            @RequestParam(required = false) String state,

            @RequestParam(required = false)
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
            LocalDate date) {

        return eventService.searchEvents(
                eventName,
                category,
                city,
                state,
                date);
    }
}
