class EntriesController < ApplicationController
  before_action :require_user
  
  def new
    @entry = Entry.new
    @goal = Goal.find(params[:goal_id])
  end
  
  def create
    @goal = Goal.find(params[:goal_id])
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.goal = @goal
    if @entry.save
      flash[:success] = "New log created."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    @goal = Goal.find(params[:goal_id])
    render 'new'
  end
  
  private
  def entry_params
    params.require(:entry).permit(:date, :status, :content, :quantity)
  end
end