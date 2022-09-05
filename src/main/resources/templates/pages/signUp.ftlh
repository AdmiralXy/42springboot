<#import "../layouts/application.ftlh" as base>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/auth.css" />
    </#if>
    <#if section="content">
        <div class="row d-flex justify-content-center pt-5">
            <div class="col-lg-5 col-md-12">
                <form method="POST" action="/signUp" class="auth-form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                    <p class="auth-form__title"><@spring.message "locale.register"/></p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" name="email" id="email" placeholder="<@spring.message "locale.email"/>" required>
                            <label for="email"><@spring.message "locale.email"/></label>
                            <#if errors?? && errors.getFieldError("email")??>
                                <small class="text-danger">${errors.getFieldError("email").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="password" id="password" placeholder="<@spring.message "locale.password"/>" required>
                            <label for="password"><@spring.message "locale.password"/></label>
                            <#if errors?? && errors.getFieldError("password")??>
                                <small class="text-danger">${errors.getFieldError("password").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="<@spring.message "locale.firstName"/>" required>
                            <label for="firstName"><@spring.message "locale.firstName"/></label>
                            <#if errors?? && errors.getFieldError("firstName")??>
                                <small class="text-danger">${errors.getFieldError("firstName").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="lastName" id="lastName" placeholder="<@spring.message "locale.lastName"/>" required>
                            <label for="lastName"><@spring.message "locale.lastName"/></label>
                            <#if errors?? && errors.getFieldError("lastName")??>
                                <small class="text-danger">${errors.getFieldError("lastName").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="phone" id="phone" placeholder="<@spring.message "locale.phone.number"/>" required>
                            <label for="phone"><@spring.message "locale.phone.number"/></label>
                            <#if errors?? && errors.getFieldError("phone")??>
                                <small class="text-danger">${errors.getFieldError("phone").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <button type="submit" class="btn auth-form__button"><@spring.message "locale.sign.up"/></button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>