package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.dto.films.*;
import com.admiralxy.cinema.entities.Film;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.List;

@Mapper(componentModel = "spring", uses = {ImagesMapper.class})
public interface FilmsMapper {

    FilmDTO toDto(Film film);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "image", source = "poster")
    Film toEntity(FilmCreateDTO filmCreateDTO);

    List<FilmDTO> toDtoList(List<Film> films);

}
