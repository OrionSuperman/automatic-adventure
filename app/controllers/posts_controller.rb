class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	user= User.find(session[:user_id])
  	post = Post.new(content: params[:content], user: user)
  	if post.valid?
  		post.save
  		redirect_to "/users/#{session[:user_id]}"
  	else
  		redirect_to "/users/#{session[:user_id]}"
  	end
  end

  def destroy
  end

end
