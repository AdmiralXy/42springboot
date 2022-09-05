<#import "../layouts/application.ftlh" as base>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/profile.css" />
    </#if>
    <#if section="content">
        <div class="row d-flex justify-content-center">
            <div class="col-xl-5 col-md-12">
                <div class="profile-container">
                    <div class="profile-card">
                        <p class="profile__name">${userDetails.user.firstName} ${userDetails.user.lastName}</p>
                        <div class="profile__info">
                            <small><@spring.message "locale.email"/></small>
                            <p>${userDetails.user.email}</p>
                        </div>
                        <div class="profile__info">
                            <small><@spring.message "locale.phone.number"/></small>
                            <p>${userDetails.user.phone}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</@base.layout>