package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.security.CinemaUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("profile")
public class ProfileController {

    @Autowired
    public ProfileController() {
    }

    @GetMapping
    public ModelAndView index(@AuthenticationPrincipal CinemaUserDetails userDetails, @ModelAttribute("model") ModelMap model) {
        model.addAttribute("userDetails", userDetails);
        return new ModelAndView("pages/profile", model);
    }
}
