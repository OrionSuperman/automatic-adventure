class LikesController < ApplicationController
  def create
  	like = Like.new(like_params)
  	if like.valid?
  		like.save
  		redirect_to "/posts"
  end
  private
  def like_params
    params.require(:like).permit(:user, :post)
  end
end
