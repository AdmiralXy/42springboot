package com.admiralxy.cinema.controllers.admin;

import com.admiralxy.cinema.dto.halls.HallCreateDTO;
import com.admiralxy.cinema.services.interfaces.IHallsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.validation.Valid;

@Controller("AdminHalls")
@RequestMapping("admin/panel/halls")
public class HallsController {

    private final IHallsService hallsService;

    @Autowired
    public HallsController(IHallsService hallsService) {
        this.hallsService = hallsService;
    }

    @GetMapping
    public ModelAndView index(@ModelAttribute("model") ModelMap model) {
        model.addAttribute("halls", this.hallsService.findAll());
        return new ModelAndView("pages/admin/halls", model);
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("hall") HallCreateDTO hall, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult);
        } else {
            this.hallsService.save(hall);
        }
        return "redirect:/admin/panel/halls";
    }
}
