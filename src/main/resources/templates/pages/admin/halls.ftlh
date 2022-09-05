<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/halls.css" />
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <#if .locale == "fr_FR">
                    <#assign description = "Nouvelle salle">
                <#else>
                    <#assign description = "New hall">
                </#if>
                <@modal.layout name="newHall" description="${description}">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" min="0" max="100000" class="form-control" name="serial" id="serial" placeholder="1" required>
                                <label for="serial">
                                    <#if .locale == "fr_FR">
                                        Numéro de série
                                    <#else>
                                        Serial number
                                    </#if>
                                </label>
                                <#if errors?? && errors.getFieldError("serial")??>
                                    <small class="text-danger">${errors.getFieldError("serial").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" min="0" max="100000" class="form-control" name="seats" id="seats" placeholder="Number of seats" required>
                                <label for="seats">
                                    <#if .locale == "fr_FR">
                                        Nombre de places
                                    <#else>
                                        Number of seats
                                    </#if>
                                </label>
                                <#if errors?? && errors.getFieldError("seats")??>
                                    <small class="text-danger">${errors.getFieldError("seats").getDefaultMessage()}</small>
                                </#if>
                            </div>
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
            <#list halls as hall>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <div class="hall">
                        <div class="hall__content">
                            <p class="hall__content__serial">
                                <#if .locale == "fr_FR">
                                    Salle #${hall.serial}
                                <#else>
                                    Hall #${hall.serial}
                                </#if>
                            </p>
                            <p class="hall__content__seats">
                                <#if .locale == "fr_FR">
                                    ${hall.seats} des places
                                <#else>
                                    ${hall.seats} seats
                                </#if>
                            </p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>