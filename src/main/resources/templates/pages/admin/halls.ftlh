<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/halls.css" />
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <#assign description>
                    <@spring.message "locale.new.hall"/>
                </#assign>
                <@modal.layout name="newHall" description="${description}">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" min="0" max="100000" class="form-control" name="serial" id="serial" placeholder="<@spring.message "locale.serial.number"/>" required>
                                <label for="serial"><@spring.message "locale.serial.number"/></label>
                                <#if errors?? && errors.getFieldError("serial")??>
                                    <small class="text-danger">${errors.getFieldError("serial").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" min="0" max="100000" class="form-control" name="seats" id="seats" placeholder="<@spring.message "locale.number.of.seats"/>" required>
                                <label for="seats"><@spring.message "locale.number.of.seats"/></label>
                                <#if errors?? && errors.getFieldError("seats")??>
                                    <small class="text-danger">${errors.getFieldError("seats").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "locale.submit"/></button>
                    </form>
                </@modal.layout>
            </div>
            <#list halls as hall>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <div class="hall">
                        <div class="hall__content">
                            <p class="hall__content__serial"><@spring.message "locale.hall"/> #${hall.serial}</p>
                            <p class="hall__content__seats">${hall.seats} <@spring.message "locale.seats"/></p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>