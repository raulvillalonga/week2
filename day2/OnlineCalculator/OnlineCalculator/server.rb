require "sinatra"
require "sinatra/reloader" if development?
require_relative "./lib/calcoperations.rb"

get "/" do
  erb(:calculator)
end

post "/calculate" do
    @first= params[:first_number].to_f
    @second= params[:second_number].to_f
    @operation= params[:operation].to_s
    @math_symbol= Calculator.new.get_math_symbol(@operation)

    @result = Calculator.new.get_result(@first,@second,@operation) 

    erb(:result)
  end

post "/save" do
  #Save.new.save_to_file(@result)
  @result = params[:result]
  erb(:calculator)
end
post "/count" do
  @number = params[:last_number]
  @result = Calculator.new.get_count(@number)
  erb(:count)
end



