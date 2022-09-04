<#assign sec=JspTaglibs["http://www.springframework.org/security/tags"]/>

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
                <a class="navbar-brand" href="${springMacroRequestContext.contextPath}/">Cinema</a>
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
                                        Sessions
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${springMacroRequestContext.contextPath}/admin/panel/films">
                                        Films
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="${springMacroRequestContext.contextPath}/admin/panel/halls">
                                        Halls
                                    </a>
                                </li>
                            </@sec.authorize>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/sessions">
                                    Search
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/profile">
                                    Profile
                                </a>
                            </li>
                        </@sec.authorize>
                        <@sec.authorize access="!isAuthenticated()">
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/signIn">
                                    Login
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${springMacroRequestContext.contextPath}/signUp">
                                    Register
                                </a>
                            </li>
                        </@sec.authorize>
                    </ul>
                    <@sec.authorize access="isAuthenticated()">
                        <div class="navbar-nav">
                            <form class="nav-link" method="POST" action="/logout">
                                <button class="btn btn-sm btn-outline-secondary my-2 my-sm-0" type="submit">Logout</button>
                            </form>
                        </div>
                    </@sec.authorize>
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
    <#nested "js">
    </html>
</#macro>