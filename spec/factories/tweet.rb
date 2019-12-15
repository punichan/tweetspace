FactoryBot.define do
  factory :tweet do
    tweet      {Faker::Name.last_name}
    image      {Faker::Avatar.image}
    created_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    user
  end
end
