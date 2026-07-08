package com.team3.Triad.Activities.repository;

import com.team3.Triad.Activities.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> {

    // Find customer by email  
    Optional<Customer> findByEmail(String email);

    // Check if email exists 
    boolean existsByEmail(String email);

    // Find customers by location 
    List<Customer> findByLocation(String location);

    // Find customers by interest  
    List<Customer> findByInterestsContaining(String interest);
}