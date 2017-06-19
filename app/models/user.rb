class User < ApplicationRecord

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password

  has_many :comments
  has_many :pictures, through: :comments

end
