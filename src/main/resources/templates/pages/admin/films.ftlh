<#import "../../layouts/application.ftlh" as base>
<#import "../../components/modal.ftlh" as modal>
<#import "/spring.ftl" as spring/>

<@base.layout; section>
    <#if section="css">
        <link rel="stylesheet" href="${springMacroRequestContext.contextPath}/css/films.css"/>
    </#if>
    <#if section="content">
        <div class="row">
            <div class="col-12 pb-5">
                <#assign description>
                    <@spring.message "locale.new.movie"/>
                </#assign>
                <@modal.layout name="newFilm" description="${description}">
                    <form method="POST" action="?" enctype="multipart/form-data">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" hidden>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="text" class="form-control" name="title" id="title" placeholder="<@spring.message "locale.title"/>" required>
                                <label for="title"><@spring.message "locale.title"/></label>
                                <#if errors?? && errors.getFieldError("title")??>
                                    <small class="text-danger">${errors.getFieldError("title").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <input type="number" min="0" max="10000" class="form-control" name="releaseYear" id="releaseYear" placeholder="<@spring.message "locale.year"/>" required>
                                <label for="releaseYear"><@spring.message "locale.year"/></label>
                                <#if errors?? && errors.getFieldError("releaseYear")??>
                                    <small class="text-danger">${errors.getFieldError("releaseYear").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="small" for="age_restrictions"><@spring.message "locale.age.restrictions"/></label>
                            <select class="form-select" name="ageRestrictions" id="ageRestrictions" required>
                                <option value="0+">0+</option>
                                <option value="6+">6+</option>
                                <option value="12+">12+</option>
                                <option value="16+">16+</option>
                                <option value="18+">18+</option>
                            </select>
                            <#if errors?? && errors.getFieldError("ageRestrictions")??>
                                <small class="text-danger">${errors.getFieldError("ageRestrictions").getDefaultMessage()}</small>
                            </#if>
                        </div>
                        <div class="mb-3">
                            <div class="form-floating">
                                <textarea class="form-control" name="description" id="description" rows="24" placeholder="<@spring.message "locale.description"/>" required></textarea>
                                <label for="description"><@spring.message "locale.description"/></label>
                                <#if errors?? && errors.getFieldError("description")??>
                                    <small class="text-danger">${errors.getFieldError("description").getDefaultMessage()}</small>
                                </#if>
                            </div>
                        </div>
                        <div class="input-group mb-3">
                            <label class="input-group-text" for="poster"><@spring.message "locale.poster"/></label>
                            <input type="file" class="form-control" name="poster" id="poster" accept="image/png, image/jpeg, image/jpg, image/webp">
                        </div>
                        <button type="submit" class="btn btn-primary"><@spring.message "locale.submit"/></button>
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
                                <img class="film__poster__image" src="/img/placeholder.jpg" alt="none">
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