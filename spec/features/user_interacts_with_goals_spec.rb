require 'rails_helper'

feature "user interacts with goals" do
  
  let(:user) { Fabricate(:user) }
  background { sign_in(user) }
  
  scenario "user creates a predefined goal" do
    visit dashboard_path
    click_link "New Goal"
    select("practice guitar", from: "Title")
    select("per week", from: "Frequency")
    select("hours", from: "Unit")
    fill_in("Quantity", with: "5")
    click_button("Create Goal")
    expect(page).to have_content("New goal created.")
  end
  
  scenario "user creates a custom goal" do
    visit dashboard_path
    click_link "New Goal"
    select("custom", from: "Title")
    find(:css, '#title2').set('Drawing')
    select("per week", from: "Frequency")
    select("hours", from: "Unit")
    fill_in("Quantity", with: "5")
    click_button("Create Goal")
    expect(page).to have_content("New goal created.")
  end
  
  scenario "user modifies a goal"
  
  scenario "user deletes a goal"
  
end