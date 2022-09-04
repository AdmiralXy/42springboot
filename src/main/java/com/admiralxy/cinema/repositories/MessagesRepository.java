package com.admiralxy.cinema.repositories;

import com.admiralxy.cinema.entities.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface MessagesRepository extends JpaRepository<Message, Long> {
    List<Message> findByFilmIdOrderByCreatedAtDesc(Long id);
}
