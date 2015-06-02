class GoalsController < ApplicationController
  before_action :require_user
  
  def index
    @goals = Goal.where(user: current_user)
    @date = Date.today
  end
  
  def new
    @goal = Goal.new
  end
  
  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      flash[:notice] = 'New goal created.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid input.'
      render 'new'
    end
  end
  
  def edit
    @goal = Goal.find(params[:id])
    render 'new'
  end
  
  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      flash[:notice] = 'Your goal is updated.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid input. Goal is not updated.'
      render 'new'
    end
  end
  
  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy if @goal.user == current_user
    flash[:notice] = 'Goal deleted.'
    redirect_to dashboard_path
  end
    
  private
  def goal_params
    params.require(:goal).permit(:title1, :title2, :frequency, :unit, :quantity)
  end
  
end