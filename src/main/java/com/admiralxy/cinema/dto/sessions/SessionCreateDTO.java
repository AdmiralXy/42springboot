package com.admiralxy.cinema.dto.sessions;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class SessionCreateDTO {

    private Long hallId;

    private Long filmId;

    @DateTimeFormat(pattern = "dd.MM.yyyy HH:mm")
    private Date startAt;

    private BigDecimal cost;

}
