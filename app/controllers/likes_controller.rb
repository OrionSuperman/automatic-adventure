class LikesController < ApplicationController
  def create
  	user = User.find(session[:user_id])
  	post = Post.find(params[:post_id])
  	like = Like.new(user: user, post: post)
  	if like.valid?
  		like.save
  		redirect_to "/posts"
  	else
  		flash[:errors] = "I don't know what went wrong"
  		redirect_to "/posts"
  	end
  end
end
