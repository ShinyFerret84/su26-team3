package com.team3.Triad.Activities.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // HOME PAGE shows the landing page for the application
    // URL: http://localhost:8080/
    @GetMapping("/")
    public String homePage() {
        return "customer/index";
    }

}