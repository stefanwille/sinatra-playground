require "sinatra"

enable :sessions

get '/' do
  @name = params[:name]
  @value = params[:value]

  if @name
    session[@name] = @value
  end

  erb :index
end

