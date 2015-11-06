require 'sinatra'
require 'sinatra/reloader'  if development?
require 'yaml/store'
require_relative('lib/Task.rb')
require_relative('lib/TodoList.rb')

require 'pry'

get "/" do
  @tareas = TodoList.new("raul")
  @tareas.load_tasks
  @listado = @tareas.tasks
  erb :index
end

post "/add" do 
  @tareas = TodoList.new("raul")
  @tas = Task.new(params[:task].to_s)
  @tareas.load_tasks
  @tareas.add_task(@tas)
  @tareas.save
  @listado = @tareas.tasks
  erb :index
end

post "/rem" do 
  @tareas = TodoList.new("raul")
  @tareas.load_tasks
  @listado = @tareas.tasks
  if params[:state] == nil
    @tareas.delete_task((params[:remove]).to_i)
  else
    @tareas.tasks.each do |tas|
      if tas.id == (params[:state]).to_i
        tas.cambiar_estado
      end
    end
  end
  @tareas.save
  @listado = @tareas.tasks
  erb :index
end