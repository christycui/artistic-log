require 'rails_helper'

describe GoalsController do
  
  let(:user) { Fabricate(:user) }
  before { set_current_user(user) }
  
  describe 'GET index' do

    it "sets @goals variable" do
      goal = Fabricate(:goal, user: user)
      get :index
      expect(assigns(:goals)).to eq([goal])
    end
    
  end
  
  describe 'GET new' do
    
    it "sets @goal variable" do
      get :new
      expect(assigns(:goal)).to be_new_record
      expect(assigns(:goal)).to be_instance_of(Goal)
    end
    
  end
  
  describe 'POST create'
  
  describe 'GET edit'
  
  describe 'POST update'
  
  describe 'DELETE destroy'
  
end