package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.dto.sessions.*;
import com.admiralxy.cinema.entities.Session;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

import java.util.List;

@Mapper(componentModel = "spring", uses = {FilmsMapper.class, HallsMapper.class})
public interface SessionsMapper {

    SessionDTO toDto(Session session);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "hall", ignore = true)
    @Mapping(target = "hall.id", source = "hallId")
    @Mapping(target = "film", ignore = true)
    @Mapping(target = "film.id", source = "filmId")
    Session toEntity(SessionCreateDTO sessionCreateDTO);

    List<SessionDTO> toDtoList(List<Session> sessions);

}
