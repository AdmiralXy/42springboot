<#macro layout name description>
    <button type="button" class="btn btn-secondary btn-lg" data-bs-toggle="modal" data-bs-target="#${name}">${description}</button>
    <div class="modal fade" id="${name}" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalLabel">${description}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <#nested>
                </div>
            </div>
        </div>
    </div>
</#macro>