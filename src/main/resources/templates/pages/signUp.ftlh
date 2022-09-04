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
                    <p class="auth-form__title">Register</p>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="email" class="form-control" name="email" id="email"
                                   placeholder="Email" required>
                            <label for="email">Email</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="password" id="password"
                                   placeholder="Password" required>
                            <label for="password">Password</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="firstName" id="firstName"
                                   placeholder="First name" required>
                            <label for="firstName">First name</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="lastName" id="lastName"
                                   placeholder="Last name" required>
                            <label for="lastName">Last name</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="phone" id="phone"
                                   placeholder="Phone number" required>
                            <label for="phone">Phone number</label>
                        </div>
                    </div>
                    <button type="submit" class="btn auth-form__button">Sign up</button>
                </form>
            </div>
        </div>
    </#if>
</@base.layout>