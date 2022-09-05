package com.admiralxy.cinema.services;

import com.admiralxy.cinema.dto.users.UserCreateDTO;
import com.admiralxy.cinema.dto.users.UserDTO;
import com.admiralxy.cinema.entities.Role;
import com.admiralxy.cinema.entities.User;
import com.admiralxy.cinema.mail.MailInfo;
import com.admiralxy.cinema.mail.MailSender;
import com.admiralxy.cinema.mappers.UsersMapper;
import com.admiralxy.cinema.repositories.UsersRepository;
import com.admiralxy.cinema.services.interfaces.IUsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
public class UsersService implements IUsersService {

    private final UsersRepository usersRepository;

    private final UsersMapper usersMapper;

    private final PasswordEncoder passwordEncoder;

    private final MailSender mailSender;

    @Autowired
    public UsersService(UsersRepository usersRepository, UsersMapper usersMapper, PasswordEncoder passwordEncoder, MailSender mailSender) {
        this.usersRepository = usersRepository;
        this.usersMapper = usersMapper;
        this.passwordEncoder = passwordEncoder;
        this.mailSender = mailSender;
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
        userToCreate.setActive(false);
        userToCreate.setActivationCode(UUID.randomUUID().toString());

        Map<String, Object> props = new HashMap<>();
        props.put("accountEmail", userToCreate.getEmail());
        props.put("activationCode", userToCreate.getActivationCode());

        MailInfo mailInfo = new MailInfo();
        mailInfo.setEmailTo(userToCreate.getEmail());
        mailInfo.setSubject("Account confirmation");
        mailInfo.setTemplateCode("activate");
        mailInfo.setProps(props);

        mailSender.send(mailInfo);

        User createdUser = usersRepository.save(userToCreate);
        return usersMapper.toDto(createdUser);
    }

    @Override
    public boolean activate(String activationCode) {
        User user = usersRepository.findByActivationCode(activationCode);

        if (user != null) {
            user.setActive(true);
            user.setActivationCode(null);
            usersRepository.save(user);
            return true;
        }

        return false;
    }
}
