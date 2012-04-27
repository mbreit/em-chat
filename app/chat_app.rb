require 'sinatra/base'

class ChatApp < Sinatra::Base
  get '/' do
    haml :index
  end
end
