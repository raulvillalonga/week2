require 'sinatra'
require 'pry'

get "/" do 
  "My first Sinatra app."
end

get "/about" do 
  @greeting = "Hello Word"
  @ingredientes = ["Tomate", "Queso", "Bacon", "Peperoni"]
  erb(:author)
end

get "/pizza" do 
  @ingredientes = ["Tomate", "Queso", "Bacon", "Peperoni"]
  erb(:pizza)
end

get "/users/:username" do 
  @username = params[:username]
  erb(:user_profile)
end

get "/hours/ago/:hora" do 
  @hora = params[:hora]
  @hora_mostrar = Time.now 
  #binding.pry
  @hora_mostrar = @hora_mostrar - ((@hora.to_i*60)*60)
  @hora_mostrar = @hora_mostrar.strftime('%H:%M')

  erb(:hora)

end