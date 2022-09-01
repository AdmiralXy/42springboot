package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.services.interfaces.ISessionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("sessions")
public class SessionsController {

    private final ISessionsService sessionsService;

    @Autowired
    public SessionsController(ISessionsService sessionsService) {
        this.sessionsService = sessionsService;
    }

    @GetMapping
    public ModelAndView index(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("sessions", this.sessionsService.findAll());
        return new ModelAndView("pages/sessions", model);
    }

    @ResponseBody
    @GetMapping("search")
    public ResponseEntity<?> search(@RequestParam("filmName") String filmName) {
        return new ResponseEntity<>(this.sessionsService.findByFilmTitleContainingIgnoreCase(filmName), HttpStatus.OK);
    }

    @GetMapping("{id}")
    public ModelAndView show(@PathVariable("id") Long id, @ModelAttribute("model") ModelMap model) {
        model.addAttribute("session", this.sessionsService.findById(id));
        return new ModelAndView("pages/session", model);
    }
}
