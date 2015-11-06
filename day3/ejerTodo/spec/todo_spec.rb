require_relative '../todo.rb'

RSpec.describe "Task checker" do 
  
  before :each do 
    @create_task = Task.new("Walk the dog")
  end  

  it "class create" do
    expect(@create_task.content).to eq("Walk the dog")
  end
  it "class id 2" do
    expect(@create_task.id).to eq(2)
  end
  it "complete?" do
    expect(@create_task.complete?).to eq(false)
  end
  it "complete!" do
    expect(@create_task.complete!).to eq(true)
  end
  it "make_incomplete!" do
    expect(@create_task.make_incomplete!).to eq(false)
  end
  it "get date" do
    expect(@create_task.que_hora).to eq("16:43 04/11/15")
  end
  it "new text content" do
    expect(@create_task.update_content!("Nuevo texto")).to eq("Nuevo texto")
  end
end

describe "TodoList checker" do   
  before :each do 
    @create_list = TodoList.new
  end  

  it "class create" do
    tarea = Task.new("Walk the dog")
    @create_list.add_task(tarea)
    expect(@create_list.tasks.length).to eq(1)
  end  
end