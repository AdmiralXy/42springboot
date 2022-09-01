package com.admiralxy.cinema.dto.messages;

import lombok.Data;

@Data
public class MessageCreateDTO {
    private Long filmId;
    private String username;
    private String message;
}
