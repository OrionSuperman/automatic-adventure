class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	post = Post.new(post_params)
  	if post.valid?
  		post.save
  		redirect_to "/users/#{session[:user_id]}"
  	else
  		redirect_to "/users/#{session[:user_id]}"
  	end
  end

  def destroy
  end
  private
  def post_params
    params.require(:post).permit(:content, :user)
  end
end
