package com.admiralxy.cinema.validation.annotation;

import com.admiralxy.cinema.validation.UniqueConstraintValidator;
import java.lang.annotation.*;
import javax.validation.*;

@Documented
@Constraint(validatedBy = UniqueConstraintValidator.class)
@Target({ElementType.FIELD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface Unique {

    String message() default "{validation.unique}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};

    Class<?> entity();
}
