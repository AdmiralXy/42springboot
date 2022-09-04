package com.admiralxy.cinema.dto.sessions;

import com.admiralxy.cinema.dto.films.FilmDTO;
import com.admiralxy.cinema.dto.halls.HallDTO;
import lombok.Data;
import java.math.BigDecimal;

@Data
public class SessionDTO {
    private Long id;
    private HallDTO hall;
    private FilmDTO film;
    private String startAt;
    private BigDecimal cost;
}
