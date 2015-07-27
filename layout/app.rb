require 'sinatra'

require 'erubis'
set :erb, :escape_html => true

enable :sessions

get '/' do
  session[:counter] ||= 0
  session[:counter] = session[:counter] + 1

  erb :index
end

