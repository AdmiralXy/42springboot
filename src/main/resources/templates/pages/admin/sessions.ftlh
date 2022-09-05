<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/sessions.css" />
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <#if .locale == "fr_FR">
                    <#assign description = "Nouvelle séance">
                <#else>
                    <#assign description = "New session">
                </#if>
                <@modal.layout name="newSession" description="${description}">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <label class="small" for="hall">
                                <#if .locale == "fr_FR">
                                    Salle
                                <#else>
                                    Hall
                                </#if>
                            </label>
                            <select class="form-select" name="hallId" id="hall" required>
                                <#list halls as hall>
                                    <option value="${hall.id}">
                                        <#if .locale == "fr_FR">
                                            #${hall.serial} (${hall.seats} des places)
                                        <#else>
                                            #${hall.serial} (${hall.seats} seats)
                                        </#if>
                                    </option>
                                </#list>
                            </select>
                            <#if errors?? && errors.getFieldError("hall")??>
                                <small class="text-danger">${errors.getFieldError("hall").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <div class="mb-3">
                            <label class="small" for="film">
                                <#if .locale == "fr_FR">
                                    Film
                                <#else>
                                    Film
                                </#if>
                            </label>
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
                                <input type="text" class="form-control" name="startAt" id="startAt" placeholder="01.12.1900 00:00" required>
                                <label for="startAt">
                                    <#if .locale == "fr_FR">
                                        Date et l'heure
                                    <#else>
                                        Date and time
                                    </#if>
                                </label>
                                <#if errors?? && errors.getFieldError("startAt")??>
                                    <small class="text-danger">${errors.getFieldError("startAt").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="input-group">
                                <input type="number" step="0.01" class="form-control" name="cost"
                                       placeholder="<#if .locale == "fr_FR">Coût du billet<#else>Ticket cost</#if>"
                                       aria-label="<#if .locale == "fr_FR">Coût du billet<#else>Ticket cost</#if>"
                                       aria-describedby="cost" required>
                                <span class="input-group-text" id="cost">$</span>
                            </div>
                            <#if errors?? && errors.getFieldError("cost")??>
                                <small class="text-danger">${errors.getFieldError("cost").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <button type="submit" class="btn btn-primary">
                            <#if .locale == "fr_FR">
                                Soumettre
                            <#else>
                                Submit
                            </#if>
                        </button>
                    </form>
                </@modal.layout>
            </div>
            <#list sessions as session>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <a class="session" href="${springMacroRequestContext.contextPath}/sessions/${session.id}">
                        <div class="session__content">
                            <p class="session__content__film">${session.film.title}</p>
                            <p class="session__content__text">
                                <#if .locale == "fr_FR">
                                    Salle #${session.hall.serial}
                                <#else>
                                    Hall #${session.hall.serial}
                                </#if>
                            </p>
                            <p class="session__content__text">${session.startAt}</p>
                            <p class="session__content__text">${session.cost}$</p>
                        </div>
                    </a>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>