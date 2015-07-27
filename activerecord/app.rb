require "sinatra/base"
require 'tilt/erubis'
require 'active_record'
require './user'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'sinatra-activerecord.sqlite3.db'
)

class App < Sinatra::Base
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
    user = User.first_or_initialize
    user.name = params[:name]
    user.email = params[:email]
    user.save!
    redirect to("/show")
  end

  get '/show' do
    user = User.first_or_initialize
    erb :show, locals: {user: user}
  end
end

