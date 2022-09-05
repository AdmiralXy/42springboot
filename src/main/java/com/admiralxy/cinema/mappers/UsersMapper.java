package com.admiralxy.cinema.mappers;

import com.admiralxy.cinema.dto.users.*;
import com.admiralxy.cinema.entities.User;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.List;

@Mapper(componentModel = "spring")
public interface UsersMapper {

    UserDTO toDto(User user);

    @Mapping(target = "id", ignore = true)
    @Mapping(target = "active", ignore = true)
    @Mapping(target = "roles", ignore = true)
    @Mapping(target = "activationCode", ignore = true)
    User toEntity(UserCreateDTO userCreateDTO);

    List<UserDTO> toDtoList(List<User> halls);

}
