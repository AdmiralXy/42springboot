<#import "../layouts/application.ftlh" as base>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/auth.css" />
    </#if>
    <#if section="content">
        <div class="row d-flex justify-content-center pt-5">
            <div class="col-lg-5 col-md-12">
                <form method="POST" action="/signIn" class="auth-form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                    <p class="auth-form__title">
                        <#if .locale == "fr_FR">
                            Connexion
                        <#else>
                            Login
                        </#if>
                    </p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="username" id="email"
                                   placeholder="email@example.com" required>
                            <label for="email">
                                <#if .locale == "fr_FR">
                                    E-mail
                                <#else>
                                    Email
                                </#if>
                            </label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="********" required>
                            <label for="password">
                                <#if .locale == "fr_FR">
                                    Le mot de passe
                                <#else>
                                    Password
                                </#if>
                            </label>
                        </div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="remember-me" id="remember" checked>
                        <label class="form-check-label" for="remember">
                            <#if .locale == "fr_FR">
                                Souviens-toi de moi
                            <#else>
                                Remember me
                            </#if>
                        </label>
                    </div>
                    <button type="submit" class="btn auth-form__button">
                        <#if .locale == "fr_FR">
                            S'identifier
                        <#else>
                            Sign in
                        </#if>
                    </button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>