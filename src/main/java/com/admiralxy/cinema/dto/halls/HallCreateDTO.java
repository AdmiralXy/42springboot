package com.admiralxy.cinema.dto.halls;

import lombok.Data;
import org.hibernate.validator.constraints.Range;
import javax.validation.constraints.NotNull;

@Data
public class HallCreateDTO {
    @NotNull(message = "{validation.not.null}")
    @Range(min = 0, max = 100000, message = "{validation.range}")
    private Integer serial;

    @NotNull(message = "{validation.not.null}")
    @Range(min = 0, max = 100000, message = "{validation.range}")
    private Integer seats;
}
