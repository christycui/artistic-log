class GoalsController < ApplicationController
  before_action :require_user
  
  def index
    @goals = Goal.where(user: current_user)
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
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
    @goal = Goal.find_by slug: params[:id]
    render 'new'
  end
  
  def update
    @goal = Goal.find_by slug: params[:id]
    if @goal.update(goal_params)
      flash[:notice] = 'Your goal is updated.'
      redirect_to dashboard_path
    else
      flash[:error] = 'Invalid input. Goal is not updated.'
      render 'new'
    end
  end
  
  def destroy
    @goal = Goal.find_by slug: params[:id]
    @goal.destroy if @goal.user == current_user
    flash[:notice] = 'Goal deleted.'
    redirect_to dashboard_path
  end
  
  def change_month
    @goal = Goal.find_by slug: params[:id]
    @date = Date.parse(params[:month])
    respond_to do |format|
      format.js
    end
  end
    
  private
  def goal_params
    params.require(:goal).permit(:title1, :title2, :frequency, :unit, :quantity)
  end
  
end