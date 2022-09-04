package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.halls.HallCreateDTO;
import com.admiralxy.cinema.dto.halls.HallDTO;
import com.admiralxy.cinema.entities.Hall;
import com.admiralxy.cinema.mappers.HallsMapper;
import com.admiralxy.cinema.repositories.HallsRepository;
import com.admiralxy.cinema.services.interfaces.IHallsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class HallsService implements IHallsService {

    private final HallsRepository hallsRepository;

    private final HallsMapper hallsMapper;

    @Autowired
    public HallsService(HallsRepository hallsRepository, HallsMapper hallsMapper) {
        this.hallsRepository = hallsRepository;
        this.hallsMapper = hallsMapper;
    }

    @Override
    public List<HallDTO> findAll() {
        return hallsMapper.toDtoList(hallsRepository.findAll());
    }

    @Override
    public HallDTO save(HallCreateDTO film) {
        Hall createdHall = hallsRepository.save(hallsMapper.toEntity(film));
        return hallsMapper.toDto(createdHall);
    }
}
