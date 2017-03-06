class User < ApplicationRecord
  has_many :articles

  validates :username, presence: true 
  has_secure_password
end
