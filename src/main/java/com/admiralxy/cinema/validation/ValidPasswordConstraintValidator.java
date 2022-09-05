package com.admiralxy.cinema.validation;

import com.admiralxy.cinema.validation.annotation.ValidPassword;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Pattern;

public class ValidPasswordConstraintValidator implements ConstraintValidator<ValidPassword, String> {

    public final Pattern passwordPattern = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$");

    @Override
    public boolean isValid(String validate, ConstraintValidatorContext ctx) {
        if (validate.length() < 8)
            return false;
        return passwordPattern.matcher(validate).matches();
    }
}
