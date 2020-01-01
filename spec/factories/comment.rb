FactoryBot.define do
  factory :comment do
    comment      {Faker::Name.last_name}
    user
    tweet
    created_at   {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at   {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
  end
end
