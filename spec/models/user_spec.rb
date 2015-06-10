require "rails_helper"

describe User do
  it { should have_many(:goals) }
  it { should have_many(:entries).through(:goals) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  describe "validation email uniqueness" do
    subject { Fabricate.build(:user) }
    it { should validate_uniqueness_of(:email) }
  end
  it { should allow_value("alice@example.com").for(:email) }
  it { should validate_presence_of(:password).on(:create) }
end