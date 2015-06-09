class Goal < ActiveRecord::Base
  include Sluggable
  attr_accessor :title1, :title2
  
  belongs_to :user
  has_many :entries
  before_save :make_title
  validates_presence_of :title1, :frequency, :unit, :quantity
  validates_presence_of :title2, if: :title1_is_custom?
  
  sluggable_column :title
  
  def make_title
    if title1_is_custom?
      self.title = format_title(title2)
    else
      self.title = format_title(title1)
    end
  end
  
  def title1_is_custom?
    title1 == 'Custom'
  end
  
  def description
    self.title + ' for ' + self.quantity.to_s + ' ' + self.unit + ' ' + self.frequency
  end
  
  private
  def format_title(title)
    title.split.map(&:capitalize).join(' ')
  end
end