# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


[1,2,3].each do |num|
  User.create(
    username:"user#{num}",
    email: "user#{num}@example.com",
    password: "test123"
  )
end

["Nature", "NYC", "Art", "Humor"].each do |tag_name|
  Tag.create(name: tag_name)
end

url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"
url2 = "http://images.nationalgeographic.com/wpf/media-live/photos/000/004/cache/african-elephant_435_600x450.jpg"

pic1 = Picture.create(
  image_url: url,
  title: "Saw a dolphin!",
  user_id: User.first.id
)

pic2 = Picture.create(
  image_url: url2,
  title: "Saw a elephant!",
  user_id: User.last.id
)

Comment.create(comment: "awesome pic",
user_id: User.first.id,
picture_id: pic1.id)

Comment.create(comment: "awesome pic",
user_id: User.last.id,
picture_id: pic2.id)

PictureTag.create(picture_id: pic1.id,
tag_id: Tag.first.id)

PictureTag.create(picture_id: pic2.id,
tag_id: Tag.last.id)
