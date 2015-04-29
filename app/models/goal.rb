class Goal < ActiveRecord::Base
  attr_accessor :title1, :title2
  belongs_to :user
  before_validation :make_title
  validates_presence_of :title1, :frequency, :unit, :quantity
  validates_presence_of :title2, if: :title1_custom?
  
  def make_title
    if @title1 == 'custom'
      self.title = @title2
    else
      self.title = @title1
    end
  end
  
  def title1
    return @title1
  end
  
  def title2
    return @title2
  end
  
  def title1_custom?
    if @title1 == 'custom'
      true
    else
      false
    end
  end
end