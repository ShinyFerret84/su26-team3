package com.team3.Triad.Activities.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.service.EventService;
import com.team3.Triad.Activities.service.ProviderService;

@Controller
public class ProviderUiController {
    private final ProviderService providerService;
    private final EventService eventService;

    public ProviderUiController(ProviderService providerService, EventService eventService) {
        this.providerService = providerService;
        this.eventService = eventService;
    }

    //Display New Provider Form
    @GetMapping("/providers/new")
    public String showProviderForm(Model model) {
        model.addAttribute("provider", new Provider());
        return "provider/new-provider-form";
    }

    //Create Provider
    @PostMapping("/providers/create")
    public String createProvider(
            @ModelAttribute Provider provider) {

        Provider savedProvider =
                providerService.createProvider(provider);

        return "redirect:/providers/"
                + savedProvider.getId();
    }

    //Provider dashboard
    @GetMapping("/providers/{id}")
    public String showProviderDashboard(
            @PathVariable Long id,
            Model model) {

        System.out.println(
            "Provider dashboard requested for ID: " + id);

        Provider provider =
                providerService.getProviderById(id);

        //Failsafe check: confirms provider ID is in the database
        if (provider == null || !provider.getActive()) {
            return "redirect:/providers/new";
        }

        List<Event> events =
                eventService.getEventsByProviderId(id);
    
        List<Event> allUpcomingEvents = events.stream()
                .filter(event ->
                        event.getDate() != null
                        && !event.getDate().isBefore(LocalDate.now()))
                .sorted((event1, event2) ->
                        event1.getDate().compareTo(event2.getDate()))
                .toList();

        List<Event> allPastEvents = events.stream()
                .filter(event ->
                        event.getDate() != null
                        && event.getDate().isBefore(LocalDate.now()))
                .sorted((event1, event2) ->
                        event2.getDate().compareTo(event1.getDate()))
                .toList();

        List<Event> upcomingEvents =
                allUpcomingEvents.stream().limit(3).toList();

        List<Event> recentPastEvents =
                allPastEvents.stream().limit(3).toList();


        model.addAttribute("provider", provider);
        model.addAttribute("upcomingEvents", upcomingEvents);
        model.addAttribute("pastEvents", recentPastEvents);
        model.addAttribute("eventCount", events.size());
        model.addAttribute("upcomingEventCount",allUpcomingEvents.size());
        model.addAttribute("pastEventCount",allPastEvents.size());

        return "provider/provider-landing";
    }

    //Display provider update form
   @GetMapping("/providers/{id}/edit")
    public String showProviderUpdateForm(
            @PathVariable Long id,
            Model model) {

        Provider provider =
                providerService.getProviderById(id);

        if (provider == null || !Boolean.TRUE.equals(provider.getActive())) {
            return "redirect:/providers/new";
        }

        model.addAttribute("provider", provider);

        return "provider/provider-profile";
    }

    //Update provider
     @PostMapping("/providers/{id}/update")
    public String updateProvider(
            @PathVariable Long id,
            @ModelAttribute("provider") Provider provider) {

        providerService.updateProvider(id, provider);

        return "redirect:/providers/" + id;
    }

    //Delete provider: Soft delete, does not remove from database completely. Marks as inactive
    @PostMapping("/providers/{id}/delete")
    public String deleteProvider(@PathVariable Long id) {

        providerService.deleteProvider(id);

        return "redirect:/providers/new";
    }

    @GetMapping("/providers/{id}/events/past")
    public String showAllPastEvents(
                @PathVariable Long id,
                Model model) {

        Provider provider =
                providerService.getProviderById(id);

        if (provider == null
                || Boolean.FALSE.equals(provider.getActive())) {

                return "redirect:/providers/new";
        }

        List<Event> pastEvents =
                eventService.getEventsByProviderId(id)
                        .stream()
                        .filter(event ->
                                event.getDate() != null
                                && event.getDate()
                                        .isBefore(LocalDate.now()))
                        .sorted((event1, event2) ->
                                event2.getDate()
                                        .compareTo(event1.getDate()))
                        .toList();

        model.addAttribute("provider", provider);
        model.addAttribute("pastEvents", pastEvents);

        return "provider/provider-past-events";
}

}
