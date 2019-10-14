require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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

    if User.find_by(:email => params["email"])
      puts "Sorry, there is already an account using this email address"
      redirect "/login"
    else
      user = User.create(params)

      if user.save
        session[:user_id] = user.id
        redirect "/"
      else
        puts "Sorry. All fields must be filled out."
        redirect "/signup"
      end

    end

  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(:email => params["email"])
    if @user && @user.authenticate(params["password"])
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
    if Helpers.is_logged_in?(session)
      erb :'bottles/new'
    else
      redirect "/login"
    end
  end

  post '/bottles' do
    user = Helpers.current_user(session)

    bottle = user.bottles.create(params)
    if bottle.save
      puts "Saved"
    else
      puts "Opps"
    end

    redirect "/bottles"

  end

  get '/bottles/:id' do

    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @bottle = Bottle.find_by_id(params["id"])
      if @user.id == @bottle.user_id
        erb :'bottles/show'
      else
        redirect "/login"
      end
    else
      redirect "/login"
    end

  end

  get '/bottles/:id/edit' do

    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      @bottle = Bottle.find_by_id(params["id"])
      if @user.id == @bottle.user_id
        erb :'bottles/edit'
      else
        redirect "/login"
      end
    else
      redirect "/login"
    end

  end

  patch '/bottles/:id' do

    @user = Helpers.current_user(session)
    @bottle = Bottle.find_by_id(params["id"])

    if @user.id == @bottle.user_id
      @bottle.update(params["bottle"])
      redirect "/bottles/#{@bottle.id}"
    else
      redirect "/login"
    end

  end

  delete '/bottles/:id' do

    @user = Helpers.current_user(session)
    @bottle = Bottle.find_by_id(params["id"])

    if @user.id == @bottle.user_id
      @bottle.destroy
      redirect "/bottles"
    else
      redirect "/login"
    end


  end

end
