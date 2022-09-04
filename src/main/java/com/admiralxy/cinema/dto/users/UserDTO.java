package com.admiralxy.cinema.dto.users;

import lombok.Data;
import com.admiralxy.cinema.entities.Role;
import java.util.Set;

@Data
public class UserDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String password;
    private String active;
    private Set<Role> roles;
}
