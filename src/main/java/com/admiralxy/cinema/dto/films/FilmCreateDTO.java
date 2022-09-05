package com.admiralxy.cinema.dto.films;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.Range;
import javax.validation.constraints.NotNull;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FilmCreateDTO {

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 40, message = "{validation.length}")
    private String title;

    @NotNull(message = "{validation.not.null}")
    @Range(min = 1000, max = 3000, message = "{validation.range}")
    private Integer releaseYear;

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 5, message = "{validation.length}")
    private String ageRestrictions;

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 20000, message = "{validation.length}")
    private String description;

    private MultipartFile poster;
}
