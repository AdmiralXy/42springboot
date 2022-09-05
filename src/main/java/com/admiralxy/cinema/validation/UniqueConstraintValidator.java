package com.admiralxy.cinema.validation;

import com.admiralxy.cinema.validation.annotation.Unique;
import org.hibernate.validator.internal.engine.constraintvalidation.ConstraintValidatorContextImpl;
import org.springframework.beans.factory.annotation.Autowired;
import javax.persistence.EntityManager;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqueConstraintValidator implements ConstraintValidator<Unique, String> {

    private Class<?> entity;

    @Autowired
    private EntityManager entityManager;

    @Override
    public void initialize(final Unique constraintAnnotation)
    {
        entity = constraintAnnotation.entity();
    }

    @Override
    public boolean isValid(String validate, ConstraintValidatorContext ctx) {
        if (entity == null) {
            return false;
        }
        ConstraintValidatorContextImpl context = (ConstraintValidatorContextImpl) ctx;
        String field = context.getConstraintViolationCreationContexts().get(0).getPath().asString();
        Object isExists = entityManager.createQuery("select count(*) from " + entity.getName() + " where " + field + " = :value")
                .setParameter("value", validate).getSingleResult();
        if ((Long) isExists != 0) {
            String messageTemplate = ctx.getDefaultConstraintMessageTemplate();
            ctx.disableDefaultConstraintViolation();
            ctx.buildConstraintViolationWithTemplate(messageTemplate)
                    .addConstraintViolation();
            return false;
        }
        return true;
    }
}
