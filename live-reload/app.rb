require "sinatra/base"

class App < Sinatra::Base
  get '/' do
    erb "<head></head>Hello World"
  end
end

