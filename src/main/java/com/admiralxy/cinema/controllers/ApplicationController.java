package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.security.CinemaUserDetails;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ApplicationController {

    @GetMapping
    public String index(@AuthenticationPrincipal CinemaUserDetails userDetails) {
        if (userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
            return "redirect:/admin/panel/halls";
        }
        return "redirect:/profile";
    }

}
