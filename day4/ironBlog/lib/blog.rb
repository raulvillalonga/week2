require 'rspec'
require 'pry'

class Blog
  def initialize
    @posts = []
  end

  def add_post(post)
    @posts << post
  end

  def get_arr_blogs
    @posts.reverse
  end

  def get_post_id id 
    @posts.find {|post| post.id == id}
  end
end