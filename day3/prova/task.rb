class Task
  attr_reader  :id, :content, :created_at, :updated_at
  @@current_id = 1

  def initialize content
    @id = @@current_id
    @content = content
    @completed = false
    @created_at = Time.now
    @updated_at = nil

    @@current_id += 1
  end

  def completed?
    @completed
  end

  def completed!
    @completed = true
  end

  def make_incompleted!
    @completed = false
  end

  def update_content! new_content
    @content = new_content
    @updated_at = Time.now
  end
end
