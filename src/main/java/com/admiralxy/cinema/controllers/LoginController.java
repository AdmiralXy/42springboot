package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.security.CinemaUserDetails;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("signIn")
public class LoginController {

    @GetMapping
    public String index(@AuthenticationPrincipal CinemaUserDetails userDetails) {
        if (userDetails != null) {
            if (userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
                return "redirect:/admin/panel/halls";
            }
            else if (userDetails.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_USER"))) {
                return "redirect:/profile";
            }
        }
        return "pages/signIn";
    }

}
