require 'rails_helper'

describe Entry do
  it { should belong_to(:goal) }
  it { should belong_to(:user) }
  
  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:quantity) }
  it { should validate_uniqueness_of(:date).scoped_to(:goal_id) }
end