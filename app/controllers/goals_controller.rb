class GoalsController < ApplicationController
  before_action :require_user
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(params.require(:goal).permit(:title, :frequency, :unit, :quantity))
    if @goal.save
      flash[:notice] = 'New goal created.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid input.'
      render 'new'
    end
  end
  
end