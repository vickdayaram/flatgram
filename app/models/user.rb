class User < ApplicationRecord

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  has_secure_password

  has_many :comments
  has_many :pictures



  #may be working be re test as you add more data.
  def received_comments
    my_comments = []
    self.pictures.each do |picture|
      picture.comments.each do |comment|
        if comment.user_id != self.id
        my_comments.push(comment)
        end
      end
    end
    my_comments
  end

end
