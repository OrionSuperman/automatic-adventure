class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
    # render :json => @post
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
