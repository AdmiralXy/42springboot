package com.admiralxy.cinema.repositories;

import com.admiralxy.cinema.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsersRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);
}
