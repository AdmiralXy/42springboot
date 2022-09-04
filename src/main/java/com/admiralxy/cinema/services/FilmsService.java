package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.films.FilmCreateDTO;
import com.admiralxy.cinema.dto.films.FilmDTO;
import com.admiralxy.cinema.entities.Film;
import com.admiralxy.cinema.mappers.FilmsMapper;
import com.admiralxy.cinema.repositories.FilmsRepository;
import com.admiralxy.cinema.services.interfaces.IFilmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FilmsService implements IFilmsService {

    private final FilmsRepository filmsRepository;

    private final FilmsMapper filmsMapper;

    @Autowired
    public FilmsService(FilmsRepository filmsRepository, FilmsMapper filmsMapper) {
        this.filmsRepository = filmsRepository;
        this.filmsMapper = filmsMapper;
    }

    @Override
    public FilmDTO findById(Long id) {
        return filmsRepository.findById(id).map(filmsMapper::toDto).orElse(null);
    }

    @Override
    public List<FilmDTO> findAll() {
        return filmsMapper.toDtoList(filmsRepository.findAll());
    }

    @Override
    public FilmDTO save(FilmCreateDTO film) {
        Film createdFilm = filmsRepository.save(filmsMapper.toEntity(film));
        return filmsMapper.toDto(createdFilm);
    }
}
