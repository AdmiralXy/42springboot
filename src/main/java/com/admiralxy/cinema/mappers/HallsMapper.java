package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.dto.halls.*;
import com.admiralxy.cinema.entities.Hall;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.List;

@Mapper(componentModel = "spring")
public interface HallsMapper {

    HallDTO toDto(Hall hall);

    @Mapping(target = "id", ignore = true)
    Hall toEntity(HallCreateDTO hallCreateDTO);

    List<HallDTO> toDtoList(List<Hall> halls);

}
