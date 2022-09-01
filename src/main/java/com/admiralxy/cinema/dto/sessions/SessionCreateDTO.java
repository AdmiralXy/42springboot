package com.admiralxy.cinema.dto.sessions;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class SessionCreateDTO {
    private Long hallId;
    private Long filmId;
    private Date startAt;
    private BigDecimal cost;
}
