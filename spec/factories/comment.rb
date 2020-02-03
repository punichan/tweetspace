FactoryBot.define do
  factory :comment do
    comment      {Faker::Name.last_name}
    user_id      {"1"}
    tweet_id     {"1"}
    created_at   {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at   {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
  end
end
