package com.admiralxy.cinema.repositories;

import com.admiralxy.cinema.entities.Session;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface SessionsRepository extends JpaRepository<Session, Long> {
    List<Session> findByFilmTitleContainingIgnoreCase(String title);
}
