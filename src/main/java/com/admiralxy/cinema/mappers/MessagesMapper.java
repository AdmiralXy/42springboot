package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.dto.messages.*;
import com.admiralxy.cinema.entities.Message;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.List;

@Mapper(componentModel = "spring")
public interface MessagesMapper {

    MessageDTO toDto(Message message);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "createdAt", ignore = true)
    @Mapping(target = "film", ignore = true)
    @Mapping(target = "film.id", source = "filmId")
    Message toEntity(MessageCreateDTO messageCreateDTO);

    List<MessageDTO> toDtoList(List<Message> messages);

}
