require 'sinatra/base'

class ChatApp < Sinatra::Base
  get '/' do
    haml :index
  end

  get '/:name.js' do |name|
    coffee name.to_sym, views: 'app/javascripts'
  end

  get '/:name.css' do |name|
    sass name.to_sym, views: 'app/stylesheets'
  end
end
