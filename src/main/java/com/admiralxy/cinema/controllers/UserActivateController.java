package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.services.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("confirm/{uuid}")
public class UserActivateController {

    private final MessageSource messageSource;

    private final UsersService usersService;

    @Autowired
    public UserActivateController(MessageSource messageSource, UsersService usersService) {
        this.messageSource = messageSource;
        this.usersService = usersService;
    }

    @GetMapping
    public String activate(@PathVariable("uuid") String uuid, RedirectAttributes redirectAttributes) {
        String activationSuccess = messageSource.getMessage("locale.activate.success", null, LocaleContextHolder.getLocale());
        String activationError = messageSource.getMessage("locale.activate.error", null, LocaleContextHolder.getLocale());

        boolean isActivated = this.usersService.activate(uuid);

        if (!isActivated)
            redirectAttributes.addFlashAttribute("activate", activationError);
        else
            redirectAttributes.addFlashAttribute("activate", activationSuccess);

        return "redirect:/signIn";
    }
}
