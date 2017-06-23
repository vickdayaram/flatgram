class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :users, through: :comments
  has_many :picture_tags
  has_many :tags, through: :picture_tags
  accepts_nested_attributes_for :tags
  validates :title, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "400x400>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
