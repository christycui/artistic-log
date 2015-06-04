class Entry < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  
  validates_presence_of :status, :date, :quantity
  validates_uniqueness_of :date, scope: :goal_id
end