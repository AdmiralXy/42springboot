package com.admiralxy.cinema.dto.users;

import com.admiralxy.cinema.entities.User;
import com.admiralxy.cinema.validation.annotation.Unique;
import com.admiralxy.cinema.validation.annotation.ValidPassword;
import lombok.Data;
import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Data
public class UserCreateDTO {

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 15, message = "{validation.length}")
    private String firstName;

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 15, message = "{validation.length}")
    private String lastName;

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 255, message = "{validation.length}")
    @Email(message = "{validation.email}")
    @Unique(entity = User.class)
    private String email;

    @NotNull(message = "{validation.not.null}")
    @Length(min = 1, max = 18, message = "{validation.length}")
    @Pattern(regexp = "\\+[0-9] \\([0-9]{3}\\) [0-9]{3}-[0-9]{2}-[0-9]{2}", message = "{validation.pattern.phone}")
    private String phone;

    @NotNull(message = "{validation.not.null}")
    @ValidPassword
    private String password;
}
