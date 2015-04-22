require 'rails_helper'

feature "user interacts with goals" do
  
  let(:user) { Fabricate(:user) }
  background { sign_in(user) }
  
  scenario "user creates a goal" do
    visit dashboard_path
    click_link "New Goal"
    select("Play Guitar", from: "I want to")
    select("Per week", from: "Frequency")
    select("Hours", from: "Unit")
    fill_in("5", from: "Quantity")
    click_button("Create Goal")
    expect(page).to have_content("New goal created.")
  end
  
  scenario "user modifies a goal"
  
  scenario "user deletes a goal"
  
end