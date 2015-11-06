require "sinatra"
require "sinatra/reloader" if development?
require "pry"
enable(:sessions)

get "/" do
  @incorrecto = ""
  erb(:index)
end

post "/validar" do
  session[:user] = {usu: params[:usu].to_s, pass:  params[:pass].to_s}
  if (params[:usu].to_s == "raul") && (params[:pass].to_s == "raul")
    erb(:result)
  else
    session[:user] = nil
    @incorrecto = "Usuario incorrecto!!"
    erb(:index)
  end
end

get "/validar" do 
  if session[:user] == nil
    #binding.pry
    erb(:index)
  else
    erb(:result)
  end
end

get "/logout" do 
  session[:user] = nil
  erb(:index)
end