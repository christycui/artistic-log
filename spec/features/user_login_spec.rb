require 'rails_helper'

feature "user logs in" do
  scenario "user signs in with correct credentails" do
    user = Fabricate(:user)
    sign_in(user)
    expect(page).to have_content(user.name)
  end
  
  scenario "user fails to sign in because of wrong credentials" do
    visit login_path
    fill_in("Email Address", with: Faker::Internet.email)
    fill_in("Password", with: "wrong_pw")
    click_button("Sign In")
    expect(page).to have_content("Incorrect")
  end
  
end