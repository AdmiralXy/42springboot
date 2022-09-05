package com.admiralxy.cinema.services.interfaces;

import com.admiralxy.cinema.dto.users.UserCreateDTO;
import com.admiralxy.cinema.dto.users.UserDTO;

public interface IUsersService {
    UserDTO findByEmail(String email);
    UserDTO save(UserCreateDTO user);
    boolean activate(String activationCode);
}
