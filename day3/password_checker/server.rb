require "sinatra"
require "sinatra/reloader" if development?
require "./lib/password_checker"

get "/" do
  erb :index
end

post "/validate" do
  if PasswordChecker.new.check_password(params[:email], params[:password])
    @validation = true
  else
    @validation = false
  end

  erb :index
end
