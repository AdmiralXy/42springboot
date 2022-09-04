package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.sessions.SessionCreateDTO;
import com.admiralxy.cinema.dto.sessions.SessionDTO;
import com.admiralxy.cinema.entities.Session;
import com.admiralxy.cinema.mappers.SessionsMapper;
import com.admiralxy.cinema.repositories.SessionsRepository;
import com.admiralxy.cinema.services.interfaces.ISessionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class SessionsService implements ISessionsService {

    private final SessionsRepository sessionsRepository;

    private final SessionsMapper sessionsMapper;

    @Autowired
    public SessionsService(SessionsRepository sessionsRepository, SessionsMapper sessionsMapper) {
        this.sessionsRepository = sessionsRepository;
        this.sessionsMapper = sessionsMapper;
    }

    @Override
    public SessionDTO findById(Long id) {
        return sessionsRepository.findById(id).map(sessionsMapper::toDto).orElse(null);
    }

    @Override
    public List<SessionDTO> findAll() {
        return sessionsMapper.toDtoList(sessionsRepository.findAll());
    }

    @Override
    public List<SessionDTO> findByFilmTitle(String title) {
        return sessionsMapper.toDtoList(sessionsRepository.findByFilmTitleContainingIgnoreCase(title));
    }

    @Override
    public SessionDTO save(SessionCreateDTO session) {
        Session createdSession = sessionsRepository.save(sessionsMapper.toEntity(session));
        return sessionsMapper.toDto(createdSession);
    }
}
