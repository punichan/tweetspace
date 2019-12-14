FactoryBot.define do
  factory :tweet do
    tweet      {Faker::Name.last_name}
    image      {"img"}
    user
    created_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
  end
end
