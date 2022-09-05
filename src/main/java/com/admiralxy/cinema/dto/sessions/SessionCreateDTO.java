package com.admiralxy.cinema.dto.sessions;

import lombok.Data;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class SessionCreateDTO {

    @NotNull(message = "{validation.not.null}")
    private Long hallId;

    @NotNull(message = "{validation.not.null}")
    private Long filmId;

    @NotNull(message = "{validation.not.null}")
    @DateTimeFormat(pattern = "dd.MM.yyyy HH:mm")
    @FutureOrPresent(message = "{validation.future.or.present}")
    private Date startAt;

    @NotNull(message = "{validation.not.null}")
    @Range(min = 0, max = 100_000_000, message = "{validation.range}")
    private BigDecimal cost;

}
