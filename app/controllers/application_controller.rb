require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get '/bottles' do
    @bottles = Bottle.all
    erb :'bottles/index'
  end

  get '/bottles/new' do
    erb :'bottles/new'
  end

end
