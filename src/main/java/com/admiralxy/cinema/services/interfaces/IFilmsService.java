package com.admiralxy.cinema.services.interfaces;

import com.admiralxy.cinema.dto.films.FilmCreateDTO;
import com.admiralxy.cinema.dto.films.FilmDTO;
import java.util.List;

public interface IFilmsService {
    FilmDTO findById(Long id);
    List<FilmDTO> findAll();
    FilmDTO save(FilmCreateDTO film);
}
