package com.admiralxy.cinema.dto.messages;

import lombok.Data;

@Data
public class MessageDTO {
    private Long id;
    private String username;
    private String message;
    private String createdAt;
}
