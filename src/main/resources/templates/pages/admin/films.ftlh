<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/films.css"/>
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <@modal.layout name="newFilm" description="New movie">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="title" id="title"
                                       placeholder="Title" required>
                                <label for="title">Title</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" class="form-control" name="releaseYear" id="releaseYear"
                                       placeholder="Year" required>
                                <label for="releaseYear">Year</label>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="small" for="age_restrictions">Age restrictions</label>
                            <select class="form-select" name="ageRestrictions" id="ageRestrictions" required>
                                <option value="0+">0+</option>
                                <option value="6+">6+</option>
                                <option value="12+">12+</option>
                                <option value="16+">16+</option>
                                <option value="18+">18+</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                            <textarea class="form-control" name="description" id="description"
                                      placeholder="Description" rows="24" required></textarea>
                                <label for="description">Description</label>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="poster">Poster</label>
                            <input type="file" class="form-control" name="poster" id="poster"
                                   accept="image/png, image/jpeg, image/jpg, image/webp">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </@modal.layout>
            </div>
            <#list films as film>
                <div class="page-card col-xxl-3 col-xl-4 col-md-6">
                    <div class="film">
                        <div class="film__poster">
                            <#if film.image?? && film.image.data?has_content>
                                <img class="film__poster__image" src="${film.image.data}" alt="none">
                            <#else>
                                <img class="film__poster__image" src="/1.jpg" alt="none">
                            </#if>
                        </div>
                        <div class="film__info">
                            <p class="film__info__title">${film.title}</p>
                            <p class="film__info__release">${film.releaseYear?string.computer}, ${film.ageRestrictions}</p>
                        </div>
                    </div>
                </div>
            </#list>
        </div>
    </#if>
</@base.layout>