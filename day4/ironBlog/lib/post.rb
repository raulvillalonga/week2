require 'rspec'
require 'pry'

class Post

  attr_reader :title, :date, :text, :id
  @@current_id = 1
  def initialize (title, text)
    @title = title
    @date = Time.now
    @text = text
    @id = @@current_id
    @@current_id += 1
  end
end