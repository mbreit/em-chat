$ ->
  ws = new WebSocket("ws://#{document.location.host.replace(/:[0-9]+$/, ':3004')}")
  window.ws = ws
  ws.onmessage = (event) ->
    console.log event
    e = (JSON.parse event.data)
    console.log e
    ($ '#msg-template').tmpl(e).appendTo($ '#chat')
  ($ '#chatform').submit (event) ->
    event.preventDefault()
    console.log event
    ws.send ($ '#chatinput').val()
    ($ '#chatinput').val('')
  ($ '#chatinput').focus()

window.formatDate = (dateString) ->
  date = new Date(dateString * 1000)
  date.toString("dd.MM.yyyy HH:mm:ss")
