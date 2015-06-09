require 'rails_helper'

feature 'user interacts with journal entries' do
  
  let(:user) { Fabricate(:user) }
  let!(:goal) { Fabricate(:goal, user: user) }
  let!(:entry) { Fabricate(:entry, user: user, goal: goal) }
  
  background { sign_in(user) }
  
  scenario 'user creates a journal entry for a goal' do
    visit dashboard_path
    click_link("[Add Journal Entry]")
    choose('Yes')
    fill_in('How long?', with: 1)
    fill_in('Content (Optional)', with: 'It went well.')
    click_button('Create Journal')
    expect(page).to have_content('It went well.')
  end
  
  scenario 'user edits a journal entry for a goal' do
    visit dashboard_path
    find("#entry_#{entry.id}_edit", :visible => false).click
    fill_in('How long?', with: 1)
    fill_in('Content (Optional)', with: 'It went well.')
    click_button('Update Journal')
    expect(page).to have_content('It went well.')
  end
  
end