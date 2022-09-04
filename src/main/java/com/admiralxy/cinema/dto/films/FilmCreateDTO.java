package com.admiralxy.cinema.dto.films;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class FilmCreateDTO {
    private String title;
    private Integer releaseYear;
    private String ageRestrictions;
    private String description;
    private MultipartFile poster;
}
