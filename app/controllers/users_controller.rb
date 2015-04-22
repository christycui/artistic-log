class UsersController < ApplicationController
  def new
    redirect_to dashboard_path if logged_in?
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to new_goal_path
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def update
    if current_user.update(user_params)
      flash[:notice] = "Profile updated!"
    else
      flash[:error] = "Unsuccessful update. Please try again."
    end
    redirect_to user_path(current_user)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end