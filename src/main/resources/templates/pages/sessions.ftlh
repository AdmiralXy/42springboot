<#import "../layouts/application.ftlh" as base>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/sessions.css" />
    </#if>
    <#if section="js">
        <script src="${springMacroRequestContext.contextPath}/js/session.js"></script>
    </#if>
    <#if section="content">
        <div class="row">
            <div class="search-form col-12 pb-5">
                <form method="GET" action="/sessions/search">
                    <div class="input-group session-search">
                        <input type="text" class="form-control" name="filmName"
                               placeholder="Enter the movie title to search the catalog..." aria-describedby="search-describe">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary session-search__button" type="submit">
                                <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg"
                                     fill-rule="evenodd"
                                     clip-rule="evenodd">
                                    <path d="M15.853 16.56c-1.683 1.517-3.911 2.44-6.353
                        2.44-5.243 0-9.5-4.257-9.5-9.5s4.257-9.5 9.5-9.5 9.5
                        4.257 9.5 9.5c0 2.442-.923 4.67-2.44 6.353l7.44
                        7.44-.707.707-7.44-7.44zm-6.353-15.56c4.691 0 8.5 3.809
                        8.5 8.5s-3.809 8.5-8.5 8.5-8.5-3.809-8.5-8.5 3.809-8.5 8.5-8.5z"/>
                                </svg>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <#list sessions as session>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <a class="session" href="${springMacroRequestContext.contextPath}/sessions/${session.id}">
                        <div class="session__content">
                            <p class="session__content__film">${session.film.title}</p>
                            <p class="session__content__text">Hall #${session.hall.serial}</p>
                            <p class="session__content__text">${session.startAt}</p>
                            <p class="session__content__text">${session.cost}$</p>
                        </div>
                    </a>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>