require 'thin'

class Chat
  include Thin::Logging

  def initialize
    @channel = EventMachine::Channel.new
  end

  def subscribe(connection)
    @channel.subscribe do |msg|
      connection.on_chat_event(msg)
    end
  end

  def push(msg)
    @channel.push(msg)
  end
end
