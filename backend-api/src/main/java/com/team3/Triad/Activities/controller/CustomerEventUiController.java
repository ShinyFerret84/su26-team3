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

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/customer")
public class CustomerEventUiController {

    @Autowired
    private EventService eventService;

    @Autowired
    private CustomerManager customerManager;

    // User story 2: Customer Browse Events shows events matching customer's interests
    // URL: http://localhost:8080/customer/browse/1
    @GetMapping("/browse/{customerId}")  // ← FIXED: Added {customerId}
    public String browseEvents(@PathVariable Long customerId,
                               @RequestParam(required = false) String search,
                               @RequestParam(required = false) String category,
                               @RequestParam(required = false) String sort,
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

        // SORT apply sorting if provided (price-low, price-high, date)
        if (sort != null && !sort.isEmpty()) {
            switch (sort) {
                case "price-low":
                    // Sort by price: Low to High
                    events = events.stream()
                            .sorted((e1, e2) -> {
                                Double p1 = e1.getPricePerPerson() != null ? e1.getPricePerPerson() : 0.0;
                                Double p2 = e2.getPricePerPerson() != null ? e2.getPricePerPerson() : 0.0;
                                return p1.compareTo(p2);
                            })
                            .toList();
                    break;
                case "price-high":
                    // Sort by price: High to Low
                    events = events.stream()
                            .sorted((e1, e2) -> {
                                Double p1 = e1.getPricePerPerson() != null ? e1.getPricePerPerson() : 0.0;
                                Double p2 = e2.getPricePerPerson() != null ? e2.getPricePerPerson() : 0.0;
                                return p2.compareTo(p1);
                            })
                            .toList();
                    break;
                case "date":
                    // Sort by date: Soonest first
                    events = events.stream()
                            .sorted((e1, e2) -> {
                                if (e1.getDate() == null && e2.getDate() == null) return 0;
                                if (e1.getDate() == null) return 1;
                                if (e2.getDate() == null) return -1;
                                return e1.getDate().compareTo(e2.getDate());
                            })
                            .toList();
                    break;
                default:
                    // featured - no sorting needed, keep as is
                    break;
            }
        }

        // Add data to model for the FreeMarker template
        model.addAttribute("customer", customer);
        model.addAttribute("events", events);
        model.addAttribute("interests", interests);
        model.addAttribute("search", search);
        model.addAttribute("category", category);
        model.addAttribute("sort", sort);

        return "customer/browse"; // loads browse.ftlh
    }
}