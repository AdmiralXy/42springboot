function updateSessionList(sessions) {
    document.querySelectorAll(".page-card").forEach((el) => el.remove())
    sessions.forEach((session) => {
        const searchForm = document.querySelector('.search-form')
        let fragment = document.createElement('div')
        fragment.classList.add('page-card', 'col-xxl-3', 'col-xl-4', 'col-md-6')
        fragment.innerHTML = `
            <a class="session" href="/sessions/${session.id}">
                <div class="session__content">
                    <p class="session__content__film">${session.film.title}</p>
                    <p class="session__content__text">#${session.hall.serial}</p>
                    <p class="session__content__text">${session.startAt}</p>
                    <p class="session__content__text">${session.cost}$</p>
                </div>
            </a>
        `
        searchForm.parentNode.insertBefore(fragment, searchForm.nextSibling)
    })
}

document.querySelector('.search-form form').addEventListener('submit', (e) => {
    e.preventDefault()
    const filmName = document.querySelector('input[name="filmName"]').value
    fetch(`/sessions/search?filmName=${filmName}`).then((response) => {
        response.json().then((body) => updateSessionList(body))
    }).catch((e) => {
        console.warn('Request failed', e)
    })
})