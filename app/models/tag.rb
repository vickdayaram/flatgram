class Tag < ApplicationRecord
  has_many :picture_tags
  has_many :pictures, through: :picture_tags
  validates :name, uniqueness: true

  def self.most_popular
    sorted_tags = Tag.all.sort_by {|tag| -tag.pictures.length}
    sorted_tags[0..2]
  end

  def self.trending
    last_ten_pictures = Picture.last(10)
    pictures_by_comments = last_ten_pictures.sort_by {|picture| -picture.comments.length}
    tags = []
    pictures_by_comments.each do |picture|
      picture.tags.each do |tag|
        tags.push(tag.name)
      end
    end
    tags.group_by(&:itself).values.max_by(&:size).first
  end


end
