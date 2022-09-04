package com.admiralxy.cinema.security;

import com.admiralxy.cinema.entities.User;
import com.admiralxy.cinema.repositories.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CinemaUserDetailsService implements UserDetailsService {

    private final UsersRepository usersRepository;

    @Autowired
    public CinemaUserDetailsService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        User user = usersRepository.findByEmail(email);
        if (user == null)
            throw new UsernameNotFoundException("User is not found");
        return new CinemaUserDetails(user);
    }

}
