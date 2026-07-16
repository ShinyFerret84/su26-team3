package com.team3.Triad.Activities.controller;

import com.team3.Triad.Activities.entity.Customer;
import com.team3.Triad.Activities.entity.Event;
import com.team3.Triad.Activities.service.CustomerManager;
import com.team3.Triad.Activities.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerEventUiController {
    // User story 2: Customer Browse Events shows events matching customer's interests
    // After running spring boot:http://localhost:8080/customer/browse/1
    @Autowired
    private EventService eventService;

    @Autowired
    private CustomerManager customerManager;


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
        List<Event> events =
        eventService.getEventsByInterests(interests)
                .stream()
                .filter(event ->
                        event.getDate() != null
                        && !event.getDate().isBefore(LocalDate.now())
                        && !event.isCancelled())
                .toList();

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

        // Add data to model for the FreeMarker template / html page
        model.addAttribute("customer", customer);
        model.addAttribute("events", events);
        model.addAttribute("interests", interests);
        model.addAttribute("search", search);
        model.addAttribute("category", category);

        return "customer/browse"; // loads browse.ftlh
    }

    // Get customer interest 
    // GET : http://localhost:8080/api/customers/1/interests

    // Add customer interest
    // POST: http://localhost:8080/api/customers/1/interests
    // Body: {"interest": "Cooking"}

    // Get all the events
    //GET: http://localhost:8080/api/events

    // Add an event 
    // Post: http://localhost:8080/api/events
    // Body: { }

    // Get event by ID
    // GET: http://localhost:8080/api/events/1
    // GET: http://localhost:8080/api/events/2
    // GET: http://localhost:8080/api/events/3
}