class PagesController < ApplicationController
  def front
    redirect_to dashboard_path if logged_in?
  end
end