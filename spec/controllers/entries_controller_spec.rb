require 'rails_helper'

describe EntriesController do
  
  let(:user) { Fabricate(:user) }
  before { set_current_user(user) }
  
  describe 'GET new' do
    
    let(:goal) { Fabricate(:goal) }
    
    it_behaves_like 'requires sign in' do
      let(:action) { get :new, goal_id: goal }
    end
    
    before { get :new, goal_id: goal }
    
    it "sets @entry variable" do
      expect(assigns(:entry)).to be_new_record
      expect(assigns(:entry)).to be_instance_of(Entry)
    end
    
    it "sets @goal variable" do
      expect(assigns(:goal)).to eq(goal)
    end
    
  end
  
  describe 'POST create' do
    
    let(:goal) { Fabricate(:goal) }
    
    it_behaves_like 'requires sign in' do
      let(:action) { post :create, goal_id: goal }
    end
    
    context 'with valid input' do
      
      before { post :create, goal_id: goal, entry: Fabricate.attributes_for(:entry) }
      
      it 'creates a journal entry' do
        expect(Entry.count).to eq(1)
      end
      
      it 'creates a journal entry associated with the goal' do
        expect(Entry.first.goal).to eq(goal)
      end
      
      it 'creates a journal entry associated with the current user' do
        expect(Entry.first.user).to eq(user)
      end
      
      it 'redirects to dashboard path' do
        expect(response).to redirect_to dashboard_path
      end
      
      it 'shows a flash message' do
        expect(flash[:notice]).not_to be_blank
      end
      
    end
    
    context 'with invalid input' do
      
      before { post :create, goal_id: goal, entry: Fabricate.attributes_for(:entry, date: '') }
      
      it 'does not create a journal entry' do
        expect(Entry.count).to eq(0)
      end
      
      it 'renders entry#new template' do
        expect(response).to render_template :new
      end
      
      it 'sets @goal variable' do
        expect(assigns(:goal)).to eq(goal)
      end
      
      it 'sets @entry variable' do
        expect(assigns(:entry)).to be_instance_of(Entry)
      end
    end
    
  end
  
  describe 'GET edit' do
    
    let(:goal) { Fabricate(:goal) }
    let(:entry) { Fabricate(:entry) }

    it_behaves_like 'requires sign in' do
      let(:action) { get :edit, goal_id: goal, id: entry }
    end
    
    before { get :edit, goal_id: goal, id: entry }
    
    it 'sets @goal variable' do
      expect(assigns(:goal)).to eq(goal)
    end
    
    it 'sets @entry variable' do
      expect(assigns(:entry)).to be_instance_of(Entry)
    end
    
    it 'renders entry#new template' do
      expect(response).to render_template :new
    end
    
  end
  
  describe 'POST update' do
    
    let(:goal) { Fabricate(:goal) }
    let(:entry) { Fabricate(:entry) }

    it_behaves_like 'requires sign in' do
      let(:action) { post :update, goal_id: goal, id: entry }
    end
    
    context 'with valid input' do
      
      before { post :update, id: entry.id, goal_id: goal.slug, entry: {date: Date.new(2015,5,1), status: entry.status, quantity: entry.quantity, content: entry.content} }
      
      it 'updates the journal entry' do
        expect(entry.reload.date).to eq(Date.new(2015,5,1))
      end
      
      it 'displays a flash' do
        expect(flash[:notice]).not_to be_blank
      end
      
      it 'redirects to dashboard path' do
        expect(response).to redirect_to dashboard_path
      end
      
    end
    
    context 'with invalid input' do
      
      before { post :update, goal_id: goal, id: entry, entry: {date: '', status: entry.status, quantity: entry.quantity, content: entry.content} }
      
      it 'does not update the journal entry' do
        expect(entry.reload.date).not_to eq('')
      end
      
      it 'renders entry#new template' do
        expect(response).to render_template :new
      end
      
      it 'sets @goal variable' do
        expect(assigns(:goal)).to eq(goal)
      end
      
      it 'sets @entry variable' do
        expect(assigns(:entry)).to be_instance_of(Entry)
      end
      
    end
  end

end