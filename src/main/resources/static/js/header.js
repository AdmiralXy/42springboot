document.addEventListener('DOMContentLoaded', () => {
    const langSelector = document.querySelector('select[name="lang"]')
    langSelector.addEventListener('change', () => {
        const newLanguage = langSelector.value
        window.location.href = `${window.location.toString().split("?")[0]}?lang=${newLanguage}`
    })
})