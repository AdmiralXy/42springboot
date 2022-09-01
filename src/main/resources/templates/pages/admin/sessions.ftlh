<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/sessions.css" />
    </#if>
    <#if section="content">
        <div class="col-12 pb-5">
            <@modal.layout name="newSession" description="New session">
                <form method="POST" action="#" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label class="small" for="hall">Hall</label>
                        <select class="form-select" name="hallId" id="hall" required>
                            <#list halls as hall>
                                <option value="${hall.id}">#${hall.serial} (${hall.seats} seats)</option>
                            </#list>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="small" for="film">Film</label>
                        <select class="form-select" name="filmId" id="film" required>
                            <#list films as film>
                                <option value="${film.id}">${film.title}</option>
                            </#list>
                        </select>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="text" class="form-control" name="startAt" id="startAt" placeholder="Date and time" required>
                            <label for="startAt">Date and time</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="input-group">
                            <input type="number" step="0.01" class="form-control" name="cost" placeholder="Ticket cost" aria-label="Ticket cost" aria-describedby="cost" required>
                            <span class="input-group-text" id="cost">$</span>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </@modal.layout>
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
    </#if>
</@base.layout>