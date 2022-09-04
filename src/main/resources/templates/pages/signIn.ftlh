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
                    <p class="auth-form__title">Login</p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="username" id="email"
                                   placeholder="Email" required>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" name="password" id="password"
                                   placeholder="Password" required>
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="remember-me" id="remember" checked>
                        <label class="form-check-label" for="remember">Remember me</label>
                    </div>
                    <button type="submit" class="btn auth-form__button">Sign in</button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>