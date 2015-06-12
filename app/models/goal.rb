class Goal < ActiveRecord::Base
  include Sluggable
  include ApplicationHelper
  attr_accessor :title1, :title2
  
  belongs_to :user
  has_many :entries
  after_validation :make_title
  before_save :make_title1, :make_title2
  validates_presence_of :title1, :frequency, :unit, :quantity
  validates_presence_of :title2, if: :title1_is_custom?
  
  sluggable_column :title
  
  def make_title
    if title1_is_custom?
      self.title = title2.split.map(&:capitalize).join(' ')
    else
      self.title = title1
    end
  end
  
  def make_title1
    self.title1 = title_options.include?(title) ? title : 'Custom'
  end
  
  def make_title2
    self.title2 = title if !title_options.include?(title)
  end
  
  def title1_is_custom?
    title1 == 'Custom'
  end
  
  def description
    self.title + ' for ' + self.quantity.to_s + ' ' + self.unit + ' ' + self.frequency
  end
  

end