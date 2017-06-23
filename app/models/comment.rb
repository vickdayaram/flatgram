class Comment < ApplicationRecord
  belongs_to :picture
  belongs_to :user

  def self.search(search)
  where("comment LIKE ?", "%#{search}%")
  end
end
