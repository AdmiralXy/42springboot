<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/halls.css" />
    </#if>
    <#if section="content">
        <div class="col-12 pb-5">
            <@modal.layout name="newHall" description="New hall">
                <form method="POST" action="#" enctype="multipart/form-data">
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="number" class="form-control" name="serial" id="serial" placeholder="Serial number" required>
                            <label for="serial">Serial number</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-floating">
                            <input type="number" class="form-control" name="seats" id="seats" placeholder="Number of seats" required>
                            <label for="seats">Number of seats</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </@modal.layout>
        </div>
        <#list halls as hall>
            <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                <div class="hall">
                    <div class="hall__content">
                        <p class="hall__content__serial">Hall #${hall.serial}</p>
                        <p class="hall__content__seats">${hall.seats} seats</p>
                    </div>
                </div>
            </div>
        </#list>
    </#if>
</@base.layout>