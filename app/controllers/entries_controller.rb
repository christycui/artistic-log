class EntriesController < ApplicationController
  before_action :require_user
  
  def new
    @entry = Entry.new
    @goal = Goal.find_by slug: params[:goal_id]
  end
  
  def create
    @goal = Goal.find_by slug: params[:goal_id]
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.goal = @goal
    if @entry.save
      flash[:notice] = "New log created."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  def edit
    @entry = Entry.find(params[:id])
    @goal = Goal.find_by slug: params[:goal_id]
    render 'new'
  end
  
  def update
    @goal = Goal.find_by slug: params[:goal_id]
    @entry = Entry.find(params[:id])
    if @entry.update(entry_params)
      flash[:notice] = "Journal entry updated."
      redirect_to dashboard_path
    else
      render 'new'
    end
  end
  
  private
  def entry_params
    params.require(:entry).permit(:date, :status, :content, :quantity)
  end
end