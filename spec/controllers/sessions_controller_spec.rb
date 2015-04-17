require "rails_helper"

describe SessionsController do
  describe "POST create" do
    
    let(:user) { Fabricate(:user) }
    
    context "when authentication passes" do
      
      before { post :create, email: user.email, password: user.password }
      
      it "saves user id in session" do
        expect(session[:user_id]).to eq(user.id)
      end
      
      it "redirects to dashboard path" do
        expect(response).to redirect_to dashboard_path
      end
      
    end
    
    context "when authentication fails" do
      
      before { post :create, email: user.email, password: "wrong" }
      
      it "does not save user id into session" do
        expect(session[:user_id]).to be_nil
      end
      
      it "sets flash error" do
        expect(flash[:error]).not_to be_blank
      end
      
      it "redirects to login_path" do
        expect(response).to redirect_to login_path
      end
      
    end
  end
end