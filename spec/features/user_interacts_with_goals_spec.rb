require 'rails_helper'

feature "user interacts with goals" do
  
  let(:user) { Fabricate(:user) }
  background { sign_in(user) }
  
  scenario "user creates a predefined goal" do
    visit dashboard_path
    click_link "New Goal"
    select("Practice Guitar", from: "Title")
    select("per week", from: "Frequency")
    select("hours", from: "Unit")
    fill_in("Quantity", with: "5")
    click_button("Create Goal")
    expect(page).to have_content("New goal created.")
  end
  
  scenario "user creates a custom goal" do
    visit dashboard_path
    click_link "New Goal"
    select("Custom", from: "Title")
    find(:css, '#title2').set('Drawing')
    select("per week", from: "Frequency")
    select("hours", from: "Unit")
    fill_in("Quantity", with: "5")
    click_button("Create Goal")
    expect(page).to have_content("New goal created.")
  end
  
  scenario "user modifies a goal" do
    Fabricate(:goal, user: user)
    visit dashboard_path
    click_link "Update Goal"
    fill_in("Quantity", with: "10")
    click_button("Update Goal")
    expect(page).to have_content("Your goal is updated.")
  end
  
  scenario "user deletes a goal" do
    Fabricate(:goal, user: user)
    visit dashboard_path
    click_link "Delete Goal"
    expect(page).to have_content("Goal deleted.")
  end
  
end