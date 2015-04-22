require "rails_helper"

feature "user updates profile" do
  
  let(:user) { Fabricate(:user) }
  background { sign_in(user) }
  
  scenario "user resets password" do
    visit user_path(user)
    fill_in("Password", with: 'new_pw')
    click_button("Update Profile")
    expect(page).to have_content("updated")
  end
  
  scenario "user updates the email" do
    visit user_path(user)
    fill_in("Email", with: 'newemail@example.com')
    click_button("Update Profile")
    expect(user.reload.email).to eq('newemail@example.com')
  end
  
end