#!/usr/bin/env ruby

require "rubygems"
require "bundler/setup"

require "eventmachine"
require "em-websocket"
require 'thin'

require './app/chat_app'
require './lib/chat'

Thin::Logging.debug = true

EventMachine.run do
  server = Thin::Server.new('0.0.0.0', 3000)
  server.app = ChatApp.new
  server.threaded = true
  server.start

  chat = Chat.new

  EventMachine::WebSocket.start(host: '0.0.0.0', port: 3004) do |ws|
    ws.onopen do
      connection = Connection.new(chat, ws)
    end
  end
end
