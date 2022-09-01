package com.admiralxy.cinema.repositories;

import com.admiralxy.cinema.entities.Hall;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HallsRepository extends JpaRepository<Hall, Long> {
}
