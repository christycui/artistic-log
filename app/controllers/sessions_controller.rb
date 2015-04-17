class SessionsController < ApplicationController
  def new
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
end