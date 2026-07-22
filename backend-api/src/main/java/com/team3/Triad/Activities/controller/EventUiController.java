package com.team3.Triad.Activities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.service.EventService;
import com.team3.Triad.Activities.service.ProviderService;

@Controller
public class EventUiController {

    private final EventService eventService;
    private final ProviderService providerService;

    public EventUiController(EventService eventService, ProviderService providerService) {
        this.eventService = eventService;
        this.providerService = providerService;
    }

    // New event form
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

        return "provider/new-event-form";
    }

    // Create event
    @PostMapping("/providers/{providerId}/events/create")
    public String createEvent(
            @PathVariable Long providerId,
            @ModelAttribute("event") Event event,
            @RequestParam String startTimeText,
            @RequestParam String startMeridiem,
            @RequestParam String endTimeText,
            @RequestParam String endMeridiem) {

        Provider provider =
                providerService.getProviderById(providerId);

        // Failsafe check: confirms the provider id is in the database
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a", Locale.ENGLISH);
        String fullStartTime = startTimeText.trim() + " " + startMeridiem;
        String fullEndTime = endTimeText.trim() + " " + endMeridiem;
        LocalTime parsedStartTime = LocalTime.parse(fullStartTime, timeFormatter);
        LocalTime parsedEndTime = LocalTime.parse(fullEndTime, timeFormatter);

        event.setStartTime(parsedStartTime);
        event.setEndTime(parsedEndTime);
        event.setProvider(provider);

        if (event.getFeatured() == null) {
            event.setFeatured(false);
        }

        eventService.createEvent(event);

        return "redirect:/providers/" + providerId;
    }

    // Display event update form
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

        DateTimeFormatter displayFormatter = DateTimeFormatter.ofPattern("h:mm", Locale.ENGLISH);
        model.addAttribute("startTimeText", event.getStartTime().format(displayFormatter));
        model.addAttribute("endTimeText", event.getEndTime().format(displayFormatter));
        model.addAttribute("startMeridiem", event.getStartTime().getHour() < 12 ? "AM" : "PM");
        model.addAttribute("endMeridiem", event.getEndTime().getHour() < 12 ? "AM" : "PM");

        return "provider/event-update-form";
    }

    // Update event
    @PostMapping("/providers/{providerId}/events/{eventId}/update")
    public String updateEvent(
            @PathVariable Long providerId,
            @PathVariable Long eventId,
            @ModelAttribute("event") Event event,
            @RequestParam String startTimeText,
            @RequestParam String startMeridiem,
            @RequestParam String endTimeText,
            @RequestParam String endMeridiem) {

        Event existingEvent =
                eventService.getEventById(eventId);

        if (existingEvent == null
                || existingEvent.getProvider() == null
                || !existingEvent.getProvider().getId().equals(providerId)) {

            return "redirect:/providers/" + providerId;
        }

        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("h:mm a", Locale.ENGLISH);
        String fullStartTime = startTimeText.trim() + " " + startMeridiem;
        String fullEndTime = endTimeText.trim() + " " + endMeridiem;
        LocalTime parsedStartTime = LocalTime.parse(fullStartTime, timeFormatter);
        LocalTime parsedEndTime = LocalTime.parse(fullEndTime, timeFormatter);

        event.setStartTime(parsedStartTime);
        event.setEndTime(parsedEndTime);
        event.setProvider(existingEvent.getProvider());

        if (event.getFeatured() == null) {
            event.setFeatured(existingEvent.getFeatured());
        }

        eventService.updateEvent(eventId, event);

        return "redirect:/providers/" + providerId;
    }

    // Delete event (cancel event; not searchable but stays in database)
    @PostMapping("/providers/{providerId}/events/{eventId}/delete")
    public String cancelEvent(
            @PathVariable Long providerId,
            @PathVariable Long eventId) {

        Event event =
                eventService.getEventById(eventId);

        if (event != null
                && event.getProvider() != null
                && event.getProvider().getId().equals(providerId)) {

            eventService.cancelEvent(eventId);
        }

        return "redirect:/providers/" + providerId;
    }

    @InitBinder("event")
    public void configureEventBinder(WebDataBinder binder) {
        binder.setDisallowedFields("startTime", "endTime");
    }
}