package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.dto.users.UserCreateDTO;
import com.admiralxy.cinema.security.CinemaUserDetails;
import com.admiralxy.cinema.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;

@Controller
@RequestMapping("signUp")
public class RegisterController {

    private final UsersService usersService;

    @Autowired
    public RegisterController(UsersService usersService) {
        this.usersService = usersService;
    }

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
        return "pages/signUp";
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("session") UserCreateDTO user, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult);
            return "redirect:/signUp";
        } else {
            this.usersService.save(user);
        }
        return "redirect:/signIn";
    }
}
