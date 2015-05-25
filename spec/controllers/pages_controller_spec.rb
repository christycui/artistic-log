require 'rails_helper'

describe PagesController do
  
  describe 'GET front' do
    
    context 'when there is a current user' do
      
      it 'redirects to dashboard path' do
        set_current_user
        get :front
        expect(response).to redirect_to dashboard_path
      end
      
    end
  end
end