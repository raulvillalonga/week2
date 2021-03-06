require 'sinatra'
require "sinatra/reloader" if development?
require_relative "./lib/post.rb"
require_relative "./lib/blog.rb"
require 'pry'


blog = Blog.new
blog.add_post(Post.new("Primera entrada","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc."))
blog.add_post(Post.new("Segundo post del blog entrada","Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante."))
blog.add_post(Post.new("Ultima entrada","Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus. Integer euismod lacus luctus magna. Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Morbi lacinia molestie dui. "))
@posts = blog.get_arr_blogs

get "/" do
  @posts = blog.get_arr_blogs
  erb(:index)
end

get "/post/:post_id" do 
  @post = blog.get_post_id(params[:post_id].to_i)
  erb(:post)
end

get "/add" do 
  erb(:add)
end

post "/save" do 
  blog.add_post(Post.new(params[:title].to_s,params[:content].to_s))
  @posts = blog.get_arr_blogs
  erb(:index)
end