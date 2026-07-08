package com.team3.Triad.Activities.repository;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.team3.Triad.Activities.entity.Event;

@Repository
public interface EventRepository extends JpaRepository<Event, Long> {
    List<Event> findByEventNameContainingIgnoreCase(String eventName);

    List<Event> findByCategoryContainingIgnoreCase(String category);

    List<Event> findByCityContainingIgnoreCase(String city);

    List<Event> findByStateContainingIgnoreCase(String state);

    List<Event> findByDate(LocalDate date);
}
