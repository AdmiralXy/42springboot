<#import "../layouts/application.ftlh" as base>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/auth.css" />
    </#if>
    <#if section="content">
        <div class="row d-flex justify-content-center pt-5">
            <div class="col-lg-5 col-md-12">
                <form method="POST" action="/signUp" class="auth-form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                    <p class="auth-form__title">
                        <#if .locale == "fr_FR">
                            S'inscrire
                        <#else>
                            Register
                        </#if>
                    </p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" name="email" id="email"
                                   placeholder="email@example.com" required>
                            <label for="email">
                                <#if .locale == "fr_FR">
                                    E-mail
                                <#else>
                                    Email
                                </#if>
                            </label>
                            <#if errors?? && errors.getFieldError("email")??>
                                <small class="text-danger">${errors.getFieldError("email").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="password" id="password"
                                   placeholder="********" required>
                            <label for="password">
                                <#if .locale == "fr_FR">
                                    Le mot de passe
                                <#else>
                                    Password
                                </#if>
                            </label>
                            <#if errors?? && errors.getFieldError("password")??>
                                <small class="text-danger">${errors.getFieldError("password").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="firstName" id="firstName"
                                   placeholder="John" required>
                            <label for="firstName">
                                <#if .locale == "fr_FR">
                                    Prénom
                                <#else>
                                    First name
                                </#if>
                            </label>
                            <#if errors?? && errors.getFieldError("firstName")??>
                                <small class="text-danger">${errors.getFieldError("firstName").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="lastName" id="lastName"
                                   placeholder="Doe" required>
                            <label for="lastName">
                                <#if .locale == "fr_FR">
                                    Nom de famille
                                <#else>
                                    Last name
                                </#if>
                            </label>
                            <#if errors?? && errors.getFieldError("lastName")??>
                                <small class="text-danger">${errors.getFieldError("lastName").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="phone" id="phone"
                                   placeholder="8 (999) 999-99-99" required>
                            <label for="phone">
                                <#if .locale == "fr_FR">
                                    Numéro de téléphone
                                <#else>
                                    Phone number
                                </#if>
                            </label>
                            <#if errors?? && errors.getFieldError("phone")??>
                                <small class="text-danger">${errors.getFieldError("phone").getDefaultMessage()}</small>
                            </#if>
                        </div>
                    </div>
                    <button type="submit" class="btn auth-form__button">
                        <#if .locale == "fr_FR">
                            S'inscrire
                        <#else>
                            Sign up
                        </#if>
                    </button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>