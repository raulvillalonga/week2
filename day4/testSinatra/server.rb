require 'sinatra'

get "/" do
  "Hola mundo"
end

get "/real_page" do
  "La otra pagina"
end

get "/hi" do
  redirect("/real_page")
end