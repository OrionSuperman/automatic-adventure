class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])

  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/users/new"
    end
  end

  def new

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end
  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password)
  end
end
