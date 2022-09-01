package com.admiralxy.cinema.services.interfaces;

import com.admiralxy.cinema.dto.sessions.SessionCreateDTO;
import com.admiralxy.cinema.dto.sessions.SessionDTO;
import java.util.List;

public interface ISessionsService {
    SessionDTO findById(Long id);
    List<SessionDTO> findAll();
    List<SessionDTO> findByFilmTitleContainingIgnoreCase(String title);
    SessionDTO save(SessionCreateDTO session);
}
