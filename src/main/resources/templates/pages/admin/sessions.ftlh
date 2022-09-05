<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/sessions.css" />
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <#assign description>
                    <@spring.message "locale.new.session"/>
                </#assign>
                <@modal.layout name="newSession" description="${description}">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <label class="small" for="hall"><@spring.message "locale.new.hall"/></label>
                            <select class="form-select" name="hallId" id="hall" required>
                                <#list halls as hall>
                                    <option value="${hall.id}">
                                        #${hall.serial} (${hall.seats} <@spring.message "locale.seats"/>)
                                    </option>
                                </#list>
                            </select>
                            <#if errors?? && errors.getFieldError("hall")??>
                                <small class="text-danger">${errors.getFieldError("hall").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <div class="mb-3">
                            <label class="small" for="film"><@spring.message "locale.film"/></label>
                            <select class="form-select" name="filmId" id="film" required>
                                <#list films as film>
                                    <option value="${film.id}">${film.title}</option>
                                </#list>
                            </select>
                            <#if errors?? && errors.getFieldError("film")??>
                                <small class="text-danger">${errors.getFieldError("film").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="startAt" id="startAt" placeholder="<@spring.message "locale.date.and.time"/>" required>
                                <label for="startAt"><@spring.message "locale.date.and.time"/></label>
                                <#if errors?? && errors.getFieldError("startAt")??>
                                    <small class="text-danger">${errors.getFieldError("startAt").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="number" step="0.01" class="form-control" name="cost"
                                       placeholder="<@spring.message "locale.ticket.cost"/>"
                                       aria-label="<@spring.message "locale.ticket.cost"/>"
                                       aria-describedby="cost" required>
                                <span class="input-group-text" id="cost">$</span>
                            </div>
                            <#if errors?? && errors.getFieldError("cost")??>
                                <small class="text-danger">${errors.getFieldError("cost").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "locale.submit"/></button>
                    </form>
                </@modal.layout>
            </div>
            <#list sessions as session>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <a class="session" href="${springMacroRequestContext.contextPath}/sessions/${session.id}">
                        <div class="session__content">
                            <p class="session__content__film">${session.film.title}</p>
                            <p class="session__content__text"><@spring.message "locale.hall"/> #${session.hall.serial}</p>
                            <p class="session__content__text">${session.startAt}</p>
                            <p class="session__content__text">${session.cost}$</p>
                        </div>
                    </a>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>