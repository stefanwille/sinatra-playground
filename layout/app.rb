require 'sinatra'
require 'erubis'


get '/' do
  session[:counter] ||= 0
  session[:counter] = session[:counter] + 1

  erb :index
end

