require 'rails_helper'

feature "user registers a new account" do
  
  scenario "user registers and stays signed in" do
    user = Fabricate.attributes_for(:user)
    register(user)
    expect(page).to have_content(user.name)
  end
  
  scenario "user fails to register with incorrect input" do
    visit register_path
    fill_in("Email Address", with: Faker::Internet.email)
    fill_in("Password", with: 'password')
    click_button("Join!")
    expect(page).to have_css(".help-block")
  end
  
end