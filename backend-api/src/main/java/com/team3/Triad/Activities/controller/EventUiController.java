package com.team3.Triad.Activities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.service.CustomerManager;
import com.team3.Triad.Activities.service.EventService;
import com.team3.Triad.Activities.service.ProviderService;

import java.util.List;
import java.util.Optional;

@Controller
public class EventUiController {

    private final EventService eventService;
    private final ProviderService providerService;
    private final CustomerManager customerManager;  // NEW: Added for US-2

    // NEW: Updated constructor to include CustomerManager for US-2
    public EventUiController(EventService eventService, ProviderService providerService, CustomerManager customerManager) {
        this.eventService = eventService;
        this.providerService = providerService;
        this.customerManager = customerManager;  // NEW: Added for US-2
    }

    //New event form
    @GetMapping("/providers/{providerId}/events/new")
    public String showNewEventForm(
            @PathVariable Long providerId,
            Model model) {

        Provider provider =
                providerService.getProviderById(providerId);

        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        model.addAttribute("provider", provider);
        model.addAttribute("event", new Event());

        return "new-event-form";
    }

     //Create event
    @PostMapping("/providers/{providerId}/events/create")
    public String createEvent(
            @PathVariable Long providerId,
            @ModelAttribute("event") Event event) {

        Provider provider =
                providerService.getProviderById(providerId);

        //Failsafe check: confirms the provider id is in the database
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        event.setProvider(provider);

        if (event.getFeatured() == null) {
            event.setFeatured(false);
        }

        eventService.createEvent(event);

        return "redirect:/providers/" + providerId;
    }

    //Display event update form
    @GetMapping("/providers/{providerId}/events/{eventId}/edit")
    public String showEventUpdateForm(
            @PathVariable Long providerId,
            @PathVariable Long eventId,
            Model model) {

        Provider provider =
                providerService.getProviderById(providerId);

        Event event =
                eventService.getEventById(eventId);

        if (provider == null || event == null) {
            return "redirect:/providers/" + providerId;
        }

        if (!event.getProvider().getId().equals(providerId)) {
            return "redirect:/providers/" + providerId;
        }

        model.addAttribute("provider", provider);
        model.addAttribute("event", event);

        return "event-update-form";
    }

    //Update event
    @PostMapping("/providers/{providerId}/events/{eventId}/update")
    public String updateEvent(
            @PathVariable Long providerId,
            @PathVariable Long eventId,
            @ModelAttribute("event") Event event) {

        Event existingEvent =
                eventService.getEventById(eventId);

        if (existingEvent == null
                || existingEvent.getProvider() == null
                || !existingEvent.getProvider().getId().equals(providerId)) {

            return "redirect:/providers/" + providerId;
        }

        event.setProvider(existingEvent.getProvider());

        eventService.updateEvent(eventId, event);

        return "redirect:/providers/" + providerId;
    }

    //Delete event
    @PostMapping("/providers/{providerId}/events/{eventId}/delete")
    public String deleteEvent(
            @PathVariable Long providerId,
            @PathVariable Long eventId) {

        Event event =
                eventService.getEventById(eventId);

        if (event != null
                && event.getProvider() != null
                && event.getProvider().getId().equals(providerId)) {

            eventService.deleteEvent(eventId);
        }

        return "redirect:/providers/" + providerId;
    }

    // User story2: Customer Browse Events shows events matching customer's interests
    // URL: http://localhost:8080/events/browse/1
    @GetMapping("/browse/{customerId}")
    public String browseEvents(@PathVariable Long customerId,
                               @RequestParam(required = false) String search,
                               @RequestParam(required = false) String category,
                               Model model) {

        // Get customer to find their interests
        Optional<Customer> customerOpt = customerManager.getCustomerById(customerId);
        if (customerOpt.isEmpty()) {
            return "error/404";
        }

        Customer customer = customerOpt.get();
        List<String> interests = customer.getInterests();

        // Get events matching customer's interests
        List<Event> events = eventService.getEventsByInterests(interests);

        // Filter by search term if provided
        if (search != null && !search.isEmpty()) {
            events = events.stream()
                    .filter(e -> e.getEventName().toLowerCase().contains(search.toLowerCase()))
                    .toList();
        }

        // Filter by category if provided
        if (category != null && !category.isEmpty()) {
            events = events.stream()
                    .filter(e -> e.getCategory().equalsIgnoreCase(category))
                    .toList();
        }

        // Add data to model for the FreeMarker template
        model.addAttribute("customer", customer);   // ← FIXED: no quotes!
        model.addAttribute("events", events);       // ← FIXED: no quotes!
        model.addAttribute("interests", interests);
        model.addAttribute("search", search);
        model.addAttribute("category", category);

        return "customer/browse"; // loads browse.ftlh
    }
}