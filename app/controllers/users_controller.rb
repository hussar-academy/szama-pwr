class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to users_path
  end

  def destroy
    user.destroy
    redirect_to users_path
  end

  def edit
    user
  end

  def update
    user.update(user_params)
    redirect_to users_path
  end

  def show
    user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :balance)
  end

  def user
    @user = User.find(params[:id])
  end
end
