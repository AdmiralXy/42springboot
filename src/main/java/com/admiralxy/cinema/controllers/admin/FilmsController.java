package com.admiralxy.cinema.controllers.admin;

import com.admiralxy.cinema.dto.films.FilmCreateDTO;
import com.admiralxy.cinema.services.interfaces.IFilmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller("AdminFilms")
@RequestMapping("admin/panel/films")
public class FilmsController {

    private final IFilmsService filmsService;

    @Autowired
    public FilmsController(IFilmsService filmsService) {
        this.filmsService = filmsService;
    }

    @GetMapping
    public ModelAndView index(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("films", this.filmsService.findAll());
        return new ModelAndView("pages/admin/films", model);
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("film") FilmCreateDTO film, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        } else {
            this.filmsService.save(film);
        }
        return "redirect:/admin/panel/films";
    }
}
