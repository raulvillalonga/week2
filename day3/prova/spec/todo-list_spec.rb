require "rspec"
require_relative "../todo-list"
require_relative "../task"

RSpec.describe TodoList do
  before :each do
    @todo_list = TodoList.new "Josh"
    @task1 = Task.new "Task #1"
    @task2 = Task.new "Task #2"
  end

  it 'has an empty array on initialize' do
    expect(@todo_list.tasks).to eq []
  end

  it 'adds tasks to the tasks list' do
    @todo_list.add_task @task1
    @todo_list.add_task @task2
    expect(@todo_list.tasks).to eq([@task1, @task2])
  end

  it 'deletes a task by id' do
    @todo_list.add_task @task1
    @todo_list.delete_task @task1.id
    expect(@todo_list.tasks).to eq([])
  end

  it 'finds a task by id' do
    @todo_list.add_task @task1
    task = @todo_list.find_task @task1.id
    expect(task).to eq(@task1)
  end

  it 'returns nil if it doesn\'t find the task' do
    task = @todo_list.find_task 99
    expect(task).to eq(nil)
  end

  it 'sorts the tasks based on the created_at attribute' do
    @todo_list.add_task @task1
    @todo_list.add_task @task2

    expect(@todo_list.sort_by_created).to eq([@task1, @task2])
  end

  it 'sorts the tasks ASC' do
    @todo_list.add_task @task1
    @todo_list.add_task @task2

    expect(@todo_list.sort_by_created "ASC").to eq([@task1, @task2])
  end

  it 'sorts the tasks DESC' do
    @todo_list.add_task @task1
    @todo_list.add_task @task2

    expect(@todo_list.sort_by_created "DESC").to eq([@task2, @task1])
  end

  it 'saves and loads tasks' do
    @todo_list.add_task @task1
    @todo_list.add_task @task2
    @todo_list.save
    @todo_list.delete_task @task1.id
    @todo_list.delete_task @task2.id
    @todo_list.load_tasks

    expect(@todo_list.tasks[0].id).to eq(@task1.id)
  end

end
