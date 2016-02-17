class PostsController < ApplicationController
  def index
  	@posts = Post.find_by_sql("SELECT posts.*, COUNT(likes.post_id) AS c FROM posts, likes WHERE likes.post_id = posts.id GROUP BY posts.id ORDER BY c DESC")
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	user= User.find(session[:user_id])
  	post = Post.new(content: params[:content], user: user)
  	if post.valid?
  		post.save
  		redirect_to "/posts/index"
  	else
  		redirect_to "/posts/index"
  	end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to "/posts/index"
  end

end
