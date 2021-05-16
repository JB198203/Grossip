# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
#---- créations de villes
10.times do 
  cities = City.create!(city_name: Faker::Address.city, zip_code: Faker::Address.zip_code)
end
#---- création d'users
users= User.create!(first_name: "Anonymous",
  last_name: "Unknown", 
  description: "Invisible man",
  email: "unknow@anonymous.jsp",
  city_id: Faker::Number.within(range:1..10),
  age: Faker::Number.within(range:181..700),
  password: "foobar")
10.times do
  users= User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.name, 
    description: Faker::Quote.most_interesting_man_in_the_world,
    email: Faker::Internet.email,
    city_id: Faker::Number.within(range:1..10),
    age: Faker::Number.within(range:18..77),
    password: "foobar")
end
#---- création de gossips
20.times do
  gossips = Gossip.create!(title: Faker::Lorem.characters(number: 10),
    content:Faker::Quote.most_interesting_man_in_the_world,
    user_id: Faker::Number.within(range:1..10))
end
#---- créations de tags
10.times do
  tags = Tag.create!(title:Faker::Book.genre)
end
#---- créations de valeurs pour la tablie de jointure enre tag et gossip
50.times do
  tag_join_gossips = TagJoinGossip.create!(tag_id: Faker::Number.within(range:1..10), gossip_id: Faker::Number.within(range:1..10))
end

#---- création des messages privés
5.times do 
  pm = PrivateMessage.create!(content:Faker::Quote.most_interesting_man_in_the_world,
    sender_id: Faker::Number.within(range:1..10),
    recipient_id:Faker::Number.within(range:1..10))
end

#---- créations des commentaires

20.times do 
  comments = Comment.create!(content: Faker::Quote.jack_handey,
    user_id: Faker::Number.within(range:1..10),
    gossip_id: Faker::Number.within(range:1..20))
end

#---- créations des likes

100.times do 
  likes = Like.create!(comment_id: Faker::Number.within(range:1..20),
  gossip_id: Faker::Number.within(range:1..20), 
  user_id: Faker::Number.within(range:1..10))
end


