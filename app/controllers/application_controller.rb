require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    # enable :sessions
    # set :session_secret, "wine-journal"
    enable :sessions unless test?
    set :session_secret, ENV["SESSION_SECRET"]
  end

  get "/" do
    erb :welcome
  end

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    user = User.create(params)
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:email => params["email"])
    if @user != nil && @user.password = params["password"]
      session[:user_id] = @user.id
      redirect "/bottles"
    end
    redirect "/login"
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

  get '/bottles' do

    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      if @user != nil
        @bottles = Bottle.where(:user_id => @user.id)
      end
    else
      redirect "/login"
    end

    erb :'bottles/index'
  end

  get '/bottles/new' do
    erb :'bottles/new'
  end

  post '/bottles/new' do
    # puts params {"name"=>"test", "brand"=>"test", "variety"=>"test", "description"=>"test", "note"=>"test"}
    user = Helpers.current_user(session)
    bottle = Bottle.create(params)
    bottle.update(user_id: user.id)
    redirect "/bottles"
  end

  get '/bottles/:id' do
    @bottle = Bottle.find_by_id(params["id"])
    erb :'bottles/show'
  end

  get '/bottles/:id/edit' do
    @bottle = Bottle.find_by_id(params["id"])
    erb :'bottles/edit'
  end

  patch '/bottles/:id' do
    @bottle = Bottle.find_by_id(params["id"])
    @bottle.update(params["bottle"])
    redirect "/bottles/#{@bottle.id}"
  end

  delete '/bottles/:id' do
    Bottle.destroy(params["id"])
    redirect "/bottles"
  end

end
