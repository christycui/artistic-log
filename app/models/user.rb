class User < ActiveRecord::Base
  include Sluggable
  has_many :goals
  has_many :entries, through: :goals
  
  has_secure_password
  validates_presence_of :name
  validates :email, presence: true, format: /@/, uniqueness: true
  validates :password, presence: true, on: :create
  
  sluggable_column :name
end