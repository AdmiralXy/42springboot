<#import "../layouts/application.ftlh" as base>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/session.css" />
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-xl-3 pt-5">
                <div class="session-poster">
                    <#if session.film.image?? && session.film.image.data?has_content>
                        <img class="session-poster__image" src="${session.film.image.data}" alt="none">
                    <#else>
                        <img class="session-poster__image" src="/img/placeholder.jpg" alt="none">
                    </#if>
                </div>
            </div>
            <div class="col-xl-9 m pt-5">
                <div class="session-info">
                    <p class="session-info__title">
                        ${session.film.title}
                    </p>
                    <p class="session-info__rating">
                        ${session.film.releaseYear?string.computer}, ${session.film.ageRestrictions}
                    </p>
                    <p class="session-info__description">
                        ${session.film.description}
                    </p>
                </div>
                <a href="${springMacroRequestContext.contextPath}/films/${session.film.id}/chat" class="btn btn-primary btn-sm btn-chat mb-5">Discussion chat</a>
                <div class="session-hall">
                    <p class="session-hall__info">
                        Hall #${session.hall.serial}, ${session.hall.seats} seats
                    </p>
                    <p class="session-hall__info">
                        ${session.startAt}
                    </p>
                    <p class="session-hall__price">
                        ${session.cost} $
                    </p>
                </div>
            </div>
        </div>
    </#if>
</@base.layout>