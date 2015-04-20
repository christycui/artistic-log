class UsersController < ApplicationController
  def new
    redirect_to dashboard_path if logged_in?
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password))
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
  end
end