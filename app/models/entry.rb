class Entry < ActiveRecord::Base
  belongs_to :goal
  belongs_to :user
  
  validates_presence_of :status, :date, :quantity
end