require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "wine-journal"
  end

  get "/" do
    erb :welcome
  end

  get '/bottles' do
    @bottles = Bottle.all
    erb :'bottles/index'
  end

end
