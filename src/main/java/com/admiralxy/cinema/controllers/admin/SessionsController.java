package com.admiralxy.cinema.controllers.admin;

import com.admiralxy.cinema.dto.sessions.SessionCreateDTO;
import com.admiralxy.cinema.services.interfaces.IFilmsService;
import com.admiralxy.cinema.services.interfaces.IHallsService;
import com.admiralxy.cinema.services.interfaces.ISessionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("AdminSessions")
@RequestMapping("admin/panel/sessions")
public class SessionsController {

    private final ISessionsService sessionsService;

    private final IHallsService hallsService;

    private final IFilmsService filmsService;

    @Autowired
    public SessionsController(ISessionsService sessionsService, IHallsService hallsService, IFilmsService filmsService) {
        this.sessionsService = sessionsService;
        this.hallsService = hallsService;
        this.filmsService = filmsService;
    }

    @GetMapping
    public ModelAndView index(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("sessions", this.sessionsService.findAll());
        model.addAttribute("halls", this.hallsService.findAll());
        model.addAttribute("films", this.filmsService.findAll());
        return new ModelAndView("pages/admin/sessions", model);
    }

    @PostMapping
    public String create(@ModelAttribute("session") SessionCreateDTO session) {
        this.sessionsService.save(session);
        return "redirect:/admin/panel/sessions";
    }
}
