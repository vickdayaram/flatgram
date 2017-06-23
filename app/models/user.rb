class User < ApplicationRecord

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  has_secure_password

  has_many :comments, dependent: :destroy #if user account is deleted, all their
  has_many :pictures, dependent: :destroy # pictures and comments will be as well.

  has_many :active_relationships, class_name:"Relationship", foreign_key:"follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:"Relationship", foreign_key:"followed_id", dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_attached_file :avatar, styles: { medium: "275x275#", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  #helper methods for following feature

  #follow another user
  def follow(other)
    active_relationships.create(follower_id: self.id, followed_id: other.id)
  end

  #unfollow a user
  def unfollow(other)
    active_relationships.find_by(follower_id: self.id, followed_id: other.id).destroy
  end

  #is following?
  def following?(other)
    following.include?(other)
  end


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
