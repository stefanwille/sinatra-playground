require "sinatra/base"
require 'tilt/erubis'

enable :sessions

set :erb, escape_html: true

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  [:get, :post].each do |method|
    send method, '/new' do
      erb :new
    end
  end

  post '/create' do
    name = params[:name]
    email = params[:email]
    redirect to("/show?name=#{name}&email=#{email}")
  end

  get '/show' do
    user = {
      name: params['name'],
      email: params['email']
    }

    erb :show, locals: {user: user}
  end
end

