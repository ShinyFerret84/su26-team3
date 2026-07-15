package com.team3.Triad.Activities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.ui.Model;

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
        return "new-provider-form";
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

    // Provider dashboard
    @GetMapping("/providers/{id}")
    public String showProviderDashboard(
            @PathVariable Long id,
            Model model) {

        Provider provider =
                providerService.getProviderById(id);

        if (provider == null) {
            return "redirect:/providers/new";
        }

        model.addAttribute("provider", provider);
        model.addAttribute(
                "eventList",
                eventService.getEventsByProviderId(id));

        return "provider-landing";
    }

    // Display provider update form
    @GetMapping("/providers/{id}/edit")
    public String showProviderUpdateForm(
            @PathVariable Long id,
            Model model) {

        Provider provider =
                providerService.getProviderById(id);

        if (provider == null) {
            return "redirect:/providers/new";
        }

        model.addAttribute("provider", provider);

        return "provider-update-form";
    }

    // Update provider
    @PostMapping("/providers/{id}/update")
    public String updateProvider(
            @PathVariable Long id,
            @ModelAttribute Provider provider) {

        providerService.updateProvider(id, provider);

        return "redirect:/providers/" + id;
    }

    // Delete provider
    @PostMapping("/providers/{id}/delete")
    public String deleteProvider(@PathVariable Long id) {

        providerService.deleteProvider(id);

        return "redirect:/providers/new";
    }

}
