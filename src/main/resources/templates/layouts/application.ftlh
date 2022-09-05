<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>
<#import "/spring.ftl" as spring/>

<#macro layout>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cinema</title>
        <link rel="icon" href="${springMacroRequestContext.contextPath}/ico/favicon.ico">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
              rel="stylesheet">
        <link href="${springMacroRequestContext.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link href="${springMacroRequestContext.contextPath}/css/normalize.css" rel="stylesheet">
        <link href="${springMacroRequestContext.contextPath}/css/application.css" rel="stylesheet">
        <#nested "css">
    </head>
    <body>

    <header>
        <nav class="navbar navbar-dark navbar-expand-lg bg-dark">
            <div class="container container-fluid">
                <a class="navbar-brand" href="${springMacroRequestContext.contextPath}/">
                    <@spring.message "locale.cinema"/>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <@sec.authorize access="isAuthenticated()">
                            <@sec.authorize access="hasRole('ADMIN')">
                                <li class="nav-item">
                                    <a class="nav-link" href="${springMacroRequestContext.contextPath}/admin/panel/sessions">
                                        <@spring.message "locale.sessions"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${springMacroRequestContext.contextPath}/admin/panel/films">
                                        <@spring.message "locale.films"/>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${springMacroRequestContext.contextPath}/admin/panel/halls">
                                        <@spring.message "locale.halls"/>
                                    </a>
                                </li>
                            </@sec.authorize>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/sessions">
                                    <@spring.message "locale.search"/>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/profile">
                                    <@spring.message "locale.profile"/>
                                </a>
                            </li>
                        </@sec.authorize>
                        <@sec.authorize access="!isAuthenticated()">
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/signIn">
                                    <@spring.message "locale.login"/>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/signUp">
                                    <@spring.message "locale.register"/>
                                </a>
                            </li>
                        </@sec.authorize>
                    </ul>
                    <div class="navbar-nav">
                        <select class="form-select form-select-lang" name="lang">
                            <option selected><@spring.message "locale.language"/></option>
                            <option value="en_US">English</option>
                            <option value="fr_FR">Français</option>
                            <option value="ru_RU">Русский</option>
                        </select>
                        <@sec.authorize access="isAuthenticated()">
                            <form class="nav-link__sign-out" method="POST" action="/signOut">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                                <button class="btn btn-sm btn-outline-secondary my-2 my-sm-0" type="submit">
                                    <@spring.message "locale.logout"/>
                                </button>
                            </form>
                        </@sec.authorize>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <main class="py-5">
        <div class="container">
            <#nested "content">
        </div>
    </main>

    <footer class="py-3">
        <div class="container">
            <div class="row">
                <div class="text-center">
                    ${.now?string('yyyy')}
                </div>
            </div>
        </div>
    </footer>

    </body>
    <script src="${springMacroRequestContext.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${springMacroRequestContext.contextPath}/js/header.js"></script>
    <#nested "js">
    </html>
</#macro>