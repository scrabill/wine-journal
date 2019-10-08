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

  post '/bottles/new' do
    # puts params {"name"=>"test", "brand"=>"test", "variety"=>"test", "description"=>"test", "note"=>"test"}
    bottle = Bottle.create(params)
    redirect "/bottles"
  end

  get '/bottles/:id' do
    @bottle = Bottle.find_by_id(params["id"])
    erb :'bottles/show'
  end

end
