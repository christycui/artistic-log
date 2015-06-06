require 'rails_helper'

describe GoalsController do
  
  let(:user) { Fabricate(:user) }
  before { set_current_user(user) }
  
  describe 'GET index' do
    
    it_behaves_like 'requires sign in' do
      let(:action) { get :index }
    end

    it "sets @goals variable" do
      goal = Fabricate(:goal, user: user)
      get :index
      expect(assigns(:goals)).to eq([goal])
    end
    
    it "sets @date variable to today when no params for month" do
      get :index
      expect(assigns(:date)).to eq(Date.today)
    end
    
    it "sets @date variable when month param is present" do
      get :index, month: Date.new(2015,5,1)
      expect(assigns(:date)).to eq(Date.new(2015,5,1))
    end
    
  end
  
  describe 'GET new' do
    
    it_behaves_like "requires sign in" do
      let(:action) { get :new }
    end
    
    it "sets @goal variable" do
      get :new
      expect(assigns(:goal)).to be_new_record
      expect(assigns(:goal)).to be_instance_of(Goal)
    end
    
  end
  
  describe 'POST create' do
    
    it_behaves_like "requires sign in" do
      let(:action) { post :create }
    end
    
    context 'with valid input' do
      
      before { post :create, goal: Fabricate.attributes_for(:goal) }
      
      it 'creates a goal' do
        expect(Goal.count).to eq(1)
      end
      
      it 'creates a goal associated with the current user' do
        expect(user.goals.count).to eq(1)
      end
      
      it 'redirects to dashboard path' do
        expect(response).to redirect_to dashboard_path
      end
      
      it 'displays a success flash' do
        expect(flash[:notice]).not_to be_blank
      end
      
    end
    
    context 'with invalid input' do
      
      before { post :create, goal: {title1: 'play piano', frequency: 'per day', unit: 'hour(s)'} }
      
      it 'does not create a goal' do
        expect(Goal.count).to eq(0)
      end
      
      it 'renders goal#new template' do
        expect(response).to render_template :new
      end
      
      it 'displays an error flash' do
        expect(flash[:error]).not_to be_blank
      end
      
      it 'sets @goal variable' do
        expect(assigns(:goal)).to be_instance_of(Goal)
      end
      
    end
    
  end
  
  describe 'GET edit' do
    
    it_behaves_like "requires sign in" do
      let(:action) { get :edit, id: 1 }
    end
    
    it 'sets @goal variable' do
      goal = Fabricate(:goal)
      get :edit, id: goal.id
      expect(assigns(:goal)).to eq(goal)
    end
    
  end
  
  describe 'POST update' do
    
    let(:goal) { Fabricate(:goal) }
    
    it_behaves_like "requires sign in" do
      let(:action) { post :update, id: 1 }
    end
    
    context 'with valid input' do
      before { post :update, id: goal.id, goal: { title1: 'Custom', title2: goal.title, frequency: goal.frequency, unit: goal.unit, quantity: '2' } }
      
      it 'updates the goal' do
        expect(goal.reload.quantity).to eq(2.0)
      end
      
      it 'redirects to dashboard page' do
        expect(response).to redirect_to dashboard_path
      end
      
      it 'sets flash notice' do
        expect(flash[:notice]).not_to be_blank
      end
      
    end
    
    context 'with invalid input' do

      before { post :update, id: goal.id, goal: { title1: 'Custom', title2: goal.title, frequency: goal.frequency, unit: goal.unit, quantity: '' } }
      
      it 'sets @goal variable' do
        expect(assigns(:goal)).to eq(goal)
      end
      
      it 'renders goal#new template' do
        expect(response).to render_template :new
      end
      
      it 'sets flash error' do
        expect(flash[:error]).not_to be_blank
      end
      
    end
    
  end
  
  describe 'DELETE destroy' do
    
    it_behaves_like "requires sign in" do
      let(:action) { delete :destroy, id: 1 }
    end
    
    it 'deletes the goal' do
      goal = Fabricate(:goal, user: user)
      delete :destroy, id: goal.id
      expect(Goal.count).to eq(0)
    end
    
    it 'does not delete the goal if the goal does not belong to current user' do
      user2 = Fabricate(:user)
      goal = Fabricate(:goal, user: user2)
      delete :destroy, id: goal.id
      expect(Goal.count).to eq(1)
    end
    
    it 'redirects to dashboard path' do
      goal = Fabricate(:goal, user: user)
      delete :destroy, id: goal.id
      expect(response).to redirect_to dashboard_path
    end
    
    it 'sets flash notice' do
      goal = Fabricate(:goal, user: user)
      delete :destroy, id: goal.id
      expect(flash[:notice]).not_to be_blank
    end
    
  end
  
  describe 'POST change_month'do
    
    it_behaves_like "requires sign in" do
      let(:action) { delete :destroy, id: 1 }
    end
    
    it 'sets @goal variable'
    
    it 'sets @date variable'
    
    it 'renders js template'
    
  end
  
end