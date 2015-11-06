require 'yaml/store'
require './task'
require 'pry'

class TodoList
  attr_reader :tasks

  def initialize user
    @todo_store = YAML::Store.new("./tasks.yml")
    @tasks = []
    @user = user
  end

  def add_task task
    @tasks << task
  end

  def delete_task task_id
    task_index = @tasks.find_index {|task| task.id == task_id}
    @tasks.delete_at task_index
    @tasks
  end

  def find_task task_id
    @tasks.find {|task| task.id == task_id}
  end

  def sort_by_created sort_by = "ASC"
    if sort_by == "ASC"
      @tasks.sort {|a, b| a.created_at <=> b.created_at}
    elsif sort_by == "DESC"
      @tasks.sort {|a, b| b.created_at <=> a.created_at}
    end
  end

  def save
    @todo_store.transaction do
        @todo_store[@user] = @tasks
    end
  end

  def load_tasks
    file = YAML::load_file("./tasks.yml")
    @tasks = file[@user]
  end
end
