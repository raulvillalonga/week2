require 'rspec'
require 'time'

class Task
    attr_reader :content, :id
    @@current_id = 1
    def initialize(content)
        @content = content
        @complete = false
        @id = @@current_id
        @@current_id += 1
        @created_at = Time.now
        @update_as = nil
    end

    def complete?
      @complete      
    end

    def complete!
      @complete = true
    end

    def make_incomplete!
      @complete = false
    end

    def que_hora
      @created_at.strftime('%H:%M %d/%m/%y')
    end

    def update_content!(text)
      @update_as = Time.now
      @content = text
    end
end

class TodoList
    attr_reader :tasks
    def initialize
        @tasks = []
    end

    def add_task(task)
      @tasks << task  
    end
    def delete_task(id)
      
    end
end