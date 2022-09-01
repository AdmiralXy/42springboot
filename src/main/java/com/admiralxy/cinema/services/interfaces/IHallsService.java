package com.admiralxy.cinema.services.interfaces;

import com.admiralxy.cinema.dto.halls.HallCreateDTO;
import com.admiralxy.cinema.dto.halls.HallDTO;
import java.util.List;

public interface IHallsService {
    List<HallDTO> findAll();
    HallDTO save(HallCreateDTO film);
}
