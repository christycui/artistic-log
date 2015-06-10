require 'rails_helper'

describe UsersController do
  describe "GET new" do
    
    it "sets @user variable" do
      get :new
      expect(assigns(:user)).to be_new_record
      expect(assigns(:user)).to be_instance_of(User)
    end
    
  end
  
  describe "POST create" do
    context "when input is valid" do
      before { post :create, user: Fabricate.attributes_for(:user) }
      
      it "creates a user" do
        expect(User.count).to eq(1)
      end
      
      it "saves user id in session" do
        expect(session[:user_id]).not_to be_nil
      end
      
      it "redirects to new goal path" do
        expect(response).to redirect_to new_goal_path
      end
      
    end
    
    context "when input is not valid" do
      before { post :create, user: Fabricate.attributes_for(:user, email: "hello") }
      
      it "does not create a user" do
        expect(User.count).to eq(0)
      end
      
      it "renders the new template" do
        expect(response).to render_template :new
      end
      
      it "sets @user variable" do
        expect(assigns(:user)).to be_instance_of(User)
      end
      
    end
  end
  
  describe "GET show" do
    
    it_behaves_like "requires sign in" do
      let(:action) { get :show, id: 1 }
    end
    
  end
  
  describe "PATCH update" do
    
    let(:current_user) { Fabricate(:user) }
    
    it_behaves_like "requires sign in" do
      let(:action) { patch :update, id: current_user }
    end
    
    context "when input is valid" do
      
      before do
        session[:user_id] = current_user.id
        patch :update, id: current_user, user: {email: current_user.email, password: "new_pw", name: current_user.name}
      end
      
      it "sets flash for successful update" do
        expect(flash[:notice]).not_to be_blank
      end
      
      it "updates the current user" do
        expect(current_user.reload.authenticate("new_pw")).to eq(current_user)
      end
      
      it "redirects to user show path" do
        expect(response).to redirect_to user_path(current_user)
      end
      
    end
    
    context "when input is invalid" do
      
      before do
        session[:user_id] = current_user.id
        patch :update, id: current_user, user: {email: current_user.email, password: "", name: ""}
      end
      
      it "sets error flash" do
        expect(flash[:error]).not_to be_blank
      end
      
      it "does not update current user" do
        expect(current_user.reload.name).not_to eq("")
      end
      
      it "redirects to user show path" do
        expect(response).to redirect_to user_path(current_user)
      end
      
    end
  end
end