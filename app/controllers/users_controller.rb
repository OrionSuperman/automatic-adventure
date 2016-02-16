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
      session[:user_name] = user.name
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = user.errors.full_messages
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

  def login
    user = User.find_by_email(params[:email])
    puts '*' *100
    puts user
    puts user.authenticate(params[:password])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_name] = user.name
      redirect_to '/users/'+ (user.id).to_s
    else
      flash[:errors] = ['Invalid Email/Password on login']
      redirect_to '/users/new'
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to '/'
  end
  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password)
  end
end
