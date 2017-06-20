class User < ApplicationRecord

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password

  has_many :comments
  has_many :pictures, through: :comments


  #may be working be re test as you add more data.
  def received_comments
    all_comments = self.comments.map {|comment| comment.picture.comment}
  end 

end
