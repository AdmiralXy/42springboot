let filmId = null
let username = 'user'
let stompClient = null

function connect() {
    let socket = new SockJS('/ws')
    stompClient = Stomp.over(socket)
    stompClient.connect({}, () => {
        stompClient.subscribe(`/films/${filmId}/chat/messages`, (messageOutput) => {
            const message = JSON.parse(messageOutput.body)
            if (message && message.id > 0 && message.createdAt) {
                showMessage(message)
            }
        })
    })
}

function disconnect() {
    if (stompClient != null)
        stompClient.disconnect()
}

function sendMessage(message) {
    stompClient.send(`/films/${filmId}/chat/messages`, {},
        JSON.stringify({
            filmId,
            username,
            message,
        })
    )
}

function showMessage(message) {
    const chatContainer = document.querySelector('.chat__container')
    let fragment = document.createElement('div')
    fragment.classList.add('chat-message')
    fragment.innerHTML = `
        <p class="chat-message__date">${message.createdAt}</p>
        <p class="chat-message__author">${message.username}</p>
        <p class="chat-message__text">${message.message}</p>
    `
    chatContainer.insertBefore(fragment, chatContainer.firstChild)
}

document.querySelector('.input-message__form').addEventListener('submit', (e) => {
    e.preventDefault()
    let message = document.querySelector('input[name="message"]').value
    if (message.length > 0)
        sendMessage(message)
    document.querySelector('input[name="message"]').value = ''
})

document.addEventListener('DOMContentLoaded', () => {
    filmId = document.querySelector('input[name="film_id"]').value
    username = document.querySelector('input[name="username"]').value
    connect()
})

window.addEventListener('beforeunload', () => {
    disconnect()
})