package com.team3.Triad.Activities.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.team3.Triad.Activities.entity.Provider;

@Repository
public interface ProviderRepository extends JpaRepository<Provider, Long> {
    
}
