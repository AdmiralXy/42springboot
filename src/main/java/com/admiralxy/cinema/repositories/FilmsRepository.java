package com.admiralxy.cinema.repositories;

import com.admiralxy.cinema.entities.Film;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FilmsRepository extends JpaRepository<Film, Long> {
}
