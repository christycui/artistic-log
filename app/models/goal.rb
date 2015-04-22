class Goal < ActiveRecord::Base
  belongs_to :user
  before_validation :make_title
  validates_presence_of :title, :frequency, :unit, :quantity
  
  def make_title
    binding.pry
    if @title1 = 'custom'
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
end