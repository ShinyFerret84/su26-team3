package com.team3.Triad.Activities.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.service.ProviderService;
import com.team3.Triad.Activities.entity.Review;

@RestController
@RequestMapping("/providers")
@CrossOrigin(origins = "*")
public class ProviderController {
    private final ProviderService providerService;

    public ProviderController(ProviderService providerService) {
        this.providerService = providerService;
    }

    //GET all providers
    @GetMapping
    public List<Provider> getAllProviders() {
        return providerService.getAllProviders();
    }

    //GET provider by ID
    @GetMapping("/{id}")
    public Provider getProviderById(@PathVariable Long id) {
        return providerService.getProviderById(id);
    }

    //CREATE provider account
    @PostMapping
    public Provider createProvider(@RequestBody Provider provider) {
        return providerService.createProvider(provider);
    }

    //UPDATE provider account
    @PutMapping("/{id}")
    public Provider updateProvider(
        @PathVariable Long id, 
        @RequestBody Provider provider) {

        return providerService.updateProvider(id, provider);
    }

    //DELETE provider account
    @DeleteMapping("/{id}")
    public void deleteProvider(@PathVariable Long id) {
        providerService.deleteProvider(id);
    }

    //GET provider review replies
    @GetMapping("/{providerId}/reviews")
    public List<Review> getProviderReviews(@PathVariable Long providerId) {
        return providerService.getProviderReviews(providerId);
    }

    @PutMapping("/reviews/{reviewId}/reply")
    public Review replyToReview(
        @PathVariable Long reviewId,
        @RequestBody Map<String, String> body) {

    return providerService.replyToReview(
            reviewId,
            body.get("reply"));
    }
}
