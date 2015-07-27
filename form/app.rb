require "sinatra/base"
require 'tilt/erubis'


class App < Sinatra::Base
  enable :sessions

  set :erb, escape_html: true

  get '/' do
    erb :index
  end

  [:get, :post].each do |method|
    send method, '/new' do
      erb :new
    end
  end

  post '/create' do
    session[:name] = params[:name]
    session[:email] = params[:email]
    redirect to("/show")
  end

  get '/show' do

    user = {
      name: session[:name],
      email: session[:email]
    }

    erb :show, locals: {user: user}
  end

  get '/session' do
    @name = session[:name]
    @value = session[:value]

    if @name
      session[@name] = @value
    end

    erb :session
  end
end

