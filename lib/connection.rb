require 'thin'

class Connection
  include Thin::Logging

  def initialize(chat, ws)
    log "New client"
    @chat, @ws = chat, ws
    @ws.onmessage { |msg| on_message(msg) }
    chat.subscribe(self)
  end

  def on_message(msg)
    log "Message: #{msg}"
    event = {type: 'message', date: Time.now.to_i, message: msg}
    @chat.push(event)
  end

  def on_chat_event(event)
    @ws.send(event.to_json)
  end
end
