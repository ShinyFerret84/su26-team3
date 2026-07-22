package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private EventService eventService;

    // HOME PAGE shows the landing page with events
    // URL: http://localhost:8080/
    @GetMapping("/")
    public String homePage(Model model) {
        // Get all events to display on home page
        List<Event> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        return "customer/index";
    }

}