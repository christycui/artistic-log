require 'rails_helper'

describe Goal do
  it { should belong_to(:user) }
  it { should have_many(:entries) }
  it { should validate_presence_of(:title1) }
  it { should validate_presence_of(:frequency) }
  it { should validate_presence_of(:unit) }
  it { should validate_presence_of(:quantity) }
  
  context 'if title1 has a value of custom' do
    subject { Fabricate.build(:goal, title1: 'Custom', title2: nil) }
    it { should validate_presence_of(:title2) }
  end
  
  describe '#make_title' do
    
    context 'if title1 is custom' do 
      
      it 'sets title as title2' do
        goal = Fabricate(:goal, title1: 'Custom', title2: 'Play Soccer')
        expect(goal.make_title).to eq('Play Soccer')
      end
      
      it 'capitalizes the first letter of customized title' do
        goal = Fabricate(:goal, title1: 'Custom', title2: 'play soccer')
        expect(goal.make_title).to eq('Play Soccer')
      end
    end

    it 'sets title as formatted title1 if title1 is not custom' do
      goal = Fabricate(:goal, title1: 'Practice Guitar')
      expect(goal.make_title).to eq(goal.title1)
    end
    
  end

  describe '#title1_is_custom?' do
    it "returns true if title1 is custom" do
      goal = Fabricate(:goal, title1: 'Custom')
      expect(goal.title1_is_custom?).to be_truthy
    end

    it "returns false if title1 is not custom" do
      goal = Fabricate(:goal, title1: 'Practice Guitar')
      expect(goal.title1_is_custom?).to be_falsey
    end
  end

  describe '#description' do
    it "generates a description for the goal" do
      goal = Fabricate(:goal, quantity: '1', unit: 'hour(s)', frequency: 'per day')
      expect(goal.description).to eq("#{goal.title} for 1.0 hour(s) per day")
    end
  end
  
end
