package com.team3.Triad.Activities.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.stereotype.Service;

import com.team3.Triad.Activities.entity.Provider;
import com.team3.Triad.Activities.repository.ProviderRepository;

@Service
public class ProviderService {
    private final ProviderRepository providerRepository;

    public ProviderService(ProviderRepository providerRepository) {
        this.providerRepository = providerRepository;
    }

    // GET all providers
    public List<Provider> getAllProviders() {
        return providerRepository.findAll();
    }

    // GET provider by ID
    public Provider getProviderById(Long id) {
        return providerRepository.findById(id).orElse(null);
    }

    // CREATE provider
    public Provider createProvider(Provider provider) {
        provider.setMemberSince(LocalDate.now());
        return providerRepository.save(provider);
    }

    // UPDATE provider
    public Provider updateProvider(Long id, Provider providerDetails) {
        return providerRepository.findById(id)
                .map(provider -> {

                    provider.setFirstName(providerDetails.getFirstName());
                    provider.setLastName(providerDetails.getLastName());
                    provider.setEmail(providerDetails.getEmail());
                    provider.setPhoneNumber(providerDetails.getPhoneNumber());

                    provider.setCompanyName(providerDetails.getCompanyName());
                    provider.setCategory(providerDetails.getCategory());
                    provider.setWebsite(providerDetails.getWebsite());
                    provider.setDescription(providerDetails.getDescription());

                    provider.setPassword(providerDetails.getPassword());

                    return providerRepository.save(provider);
                })
                .orElse(null);
    }

    // DELETE provider
    public void deleteProvider(Long id) {
        providerRepository.deleteById(id);
    }
}

