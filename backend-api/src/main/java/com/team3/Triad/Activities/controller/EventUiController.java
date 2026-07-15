package com.team3.Triad.Activities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.service.EventService;

@Controller
public class EventUiController {
    private final EventService eventService;

    public EventUiController(EventService eventService) {
        this.eventService = eventService;
    }

    //New event form
    @GetMapping("/create-event")
    public String newEvent() {
        return "new-event-form";
    }

    @PostMapping("/create-event")
    public String createEvent(@ModelAttribute Event event) {
        eventService.createEvent(event);
        return "redirect:/create-event";
    }
}
