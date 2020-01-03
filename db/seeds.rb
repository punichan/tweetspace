

50.times do |n| 

Tweet.create(
  tweet: Faker::Name.name,
  food: Faker::Name.name,
  price: "100",
  store: Faker::Name.name,
  image: File.open("./app/assets/images/default.jpg"),
  place_id: "1",
  category_id: "1",
  user_id: "1",
)
end