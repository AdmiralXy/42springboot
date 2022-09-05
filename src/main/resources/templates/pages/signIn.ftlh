<#import "../layouts/application.ftlh" as base>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/auth.css" />
    </#if>
    <#if section="content">
        <div class="row d-flex justify-content-center pt-5">
            <div class="col-lg-5 col-md-12">
                <form method="POST" action="/signIn" class="auth-form">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                    <p class="auth-form__title"><@spring.message "locale.login"/></p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="username" id="email" placeholder="<@spring.message "locale.email"/>" required>
                            <label for="email"><@spring.message "locale.email"/></label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="password" class="form-control" name="password" id="password" placeholder="<@spring.message "locale.password"/>" required>
                            <label for="password"><@spring.message "locale.password"/></label>
                        </div>
                    </div>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" name="remember-me" id="remember" checked>
                        <label class="form-check-label" for="remember"><@spring.message "locale.remember.me"/></label>
                    </div>
                    <button type="submit" class="btn auth-form__button"><@spring.message "locale.sign.in"/></button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>