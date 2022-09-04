package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.users.UserCreateDTO;
import com.admiralxy.cinema.dto.users.UserDTO;
import com.admiralxy.cinema.entities.Role;
import com.admiralxy.cinema.entities.User;
import com.admiralxy.cinema.mappers.UsersMapper;
import com.admiralxy.cinema.repositories.UsersRepository;
import com.admiralxy.cinema.services.interfaces.IUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Collections;

@Service
public class UsersService implements IUsersService {

    private final UsersRepository usersRepository;

    private final UsersMapper usersMapper;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public UsersService(UsersRepository usersRepository, UsersMapper usersMapper, PasswordEncoder passwordEncoder) {
        this.usersRepository = usersRepository;
        this.usersMapper = usersMapper;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public UserDTO findByEmail(String email) {
        return usersMapper.toDto(usersRepository.findByEmail(email));
    }

    @Override
    public UserDTO save(UserCreateDTO user) {
        User userToCreate = usersMapper.toEntity(user);
        userToCreate.setPassword(passwordEncoder.encode(userToCreate.getPassword()));
        userToCreate.setRoles(Collections.singleton(Role.ROLE_USER));
        userToCreate.setActive(true);

        User createdUser = usersRepository.save(userToCreate);
        return usersMapper.toDto(createdUser);
    }
}
