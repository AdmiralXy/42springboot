package com.admiralxy.cinema.dto.users;

import lombok.Data;

@Data
public class UserCreateDTO {
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
}
