class Goal < ActiveRecord::Base
  attr_accessor :title1, :title2
  
  belongs_to :user
  before_save :make_title
  validates_presence_of :title1, :frequency, :unit, :quantity
  validates_presence_of :title2, if: :title1_is_custom?
  
  def make_title
    if title1_is_custom?
      self.title = title2
    else
      self.title = title1
    end
  end
  
  def title1_is_custom?
    title1 == 'custom'
  end
end