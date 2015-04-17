class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :name
  validates :email, presence: true, format: /@/, uniqueness: true
  validates :password, presence: true, on: :create
end