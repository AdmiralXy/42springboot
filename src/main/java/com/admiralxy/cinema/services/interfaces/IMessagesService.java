package com.admiralxy.cinema.services.interfaces;

import com.admiralxy.cinema.dto.messages.MessageCreateDTO;
import com.admiralxy.cinema.dto.messages.MessageDTO;
import java.util.List;

public interface IMessagesService {
    List<MessageDTO> findByFilmId(Long id);
    MessageDTO save(MessageCreateDTO message);
}
