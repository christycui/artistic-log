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
      
      it "redirects to root path" do
        expect(response).to redirect_to root_path
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
end