class SessionsController < ApplicationController
  def new
    redirect_to dashboard_path if logged_in?
  end
  
  def create
    user = User.find_by email: params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = "Incorrect email or password."
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end