package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.messages.MessageCreateDTO;
import com.admiralxy.cinema.dto.messages.MessageDTO;
import com.admiralxy.cinema.entities.Message;
import com.admiralxy.cinema.mappers.MessagesMapper;
import com.admiralxy.cinema.repositories.MessagesRepository;
import com.admiralxy.cinema.services.interfaces.IMessagesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MessagesService implements IMessagesService {

    private final MessagesRepository messagesRepository;

    private final MessagesMapper messagesMapper;

    @Autowired
    public MessagesService(MessagesRepository messagesRepository, MessagesMapper messagesMapper) {
        this.messagesRepository = messagesRepository;
        this.messagesMapper = messagesMapper;
    }

    @Override
    public List<MessageDTO> findByFilmId(Long id) {
        return messagesMapper.toDtoList(messagesRepository.findByFilmId(id));
    }

    @Override
    public MessageDTO save(MessageCreateDTO message) {
        Message createdMessage = messagesRepository.save(messagesMapper.toEntity(message));
        return messagesMapper.toDto(createdMessage);
    }
}
