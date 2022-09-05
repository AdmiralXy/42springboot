package com.admiralxy.cinema.validation.annotation;

import com.admiralxy.cinema.validation.ValidPasswordConstraintValidator;
import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = ValidPasswordConstraintValidator.class)
@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface ValidPassword {

    String message() default "{validation.valid.password}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

}
