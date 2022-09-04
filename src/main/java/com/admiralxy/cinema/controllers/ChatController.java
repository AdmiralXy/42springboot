package com.admiralxy.cinema.controllers;

import com.admiralxy.cinema.dto.messages.MessageCreateDTO;
import com.admiralxy.cinema.dto.messages.MessageDTO;
import com.admiralxy.cinema.services.interfaces.IFilmsService;
import com.admiralxy.cinema.services.interfaces.IMessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("films/{id}/chat")
public class ChatController {

    private final IFilmsService filmsService;

    private final IMessagesService messagesService;

    @Autowired
    public ChatController(IFilmsService filmsService, IMessagesService messagesService) {
        this.filmsService = filmsService;
        this.messagesService = messagesService;
    }

    @GetMapping
    public ModelAndView index(@PathVariable("id") Long id, @ModelAttribute("model") ModelMap model) {
        model.addAttribute("film", this.filmsService.findById(id));
        model.addAttribute("messages", this.messagesService.findByFilmId(id));
        return new ModelAndView("pages/chat", model);
    }

    @MessageMapping("/films/{id}/chat/messages")
    @SendTo("/films/{id}/chat/messages")
    public MessageDTO send(@DestinationVariable String id, MessageCreateDTO message) {
        return this.messagesService.save(message);
    }
}
