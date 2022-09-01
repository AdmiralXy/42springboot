package com.admiralxy.cinema.dto.films;

import com.admiralxy.cinema.dto.images.ImageDTO;
import lombok.Data;

@Data
public class FilmDTO {
    private Long id;
    private String title;
    private Integer releaseYear;
    private String ageRestrictions;
    private String description;
    private ImageDTO image;
}
