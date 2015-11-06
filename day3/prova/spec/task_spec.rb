require "rspec"
require_relative "../task.rb"

RSpec.describe Task do

  before :each do
    @todo1 = Task.new "Walk the dog"
    @todo2 = Task.new "Walk the dog"
  end

  after :each do
    Task.class_variable_set :@@current_id, 1
  end

  it 'returns a Task object' do
    expect(@todo1).to be_instance_of(Task)
  end

  it 'has a content attribute' do
    expect(@todo1.content).to eq("Walk the dog")
  end

  it 'the first id is 1' do
    expect(@todo1.id).to eq(1)
  end

  it 'has unique id attribute' do
    expect(@todo1.id).not_to eq(@todo2.id)
  end

  it 'the task is not completed by default' do
    expect(@todo1.completed?).to be false
  end

  it 'makes the task completed' do
    @todo2.completed!
    expect(@todo2.completed?).to be true
  end

  it 'makes the task incompleted' do
    @todo2.make_incompleted!
    expect(@todo2.completed?).to be false
  end

  it 'has a created_at attribute equal to the current time' do
    expect(@todo1.created_at.strftime('%Y-%m-%dT%H:%M:%S')).to eq(Time.now.strftime('%Y-%m-%dT%H:%M:%S'))
  end

  it 'updates the content' do
    @todo1.update_content! "Updated content"
    expect(@todo1.content).to eq("Updated content")
  end

  it 'updated_at is nil by default' do
    expect(@todo1.updated_at).to be_nil
  end

  it 'updated_at updates when content_update is called' do
    @todo1.update_content! "New updated content"
    expect(@todo1.updated_at.strftime('%Y-%m-%dT%H:%M:%S')).to eq(Time.now.strftime('%Y-%m-%dT%H:%M:%S'))
  end
end
