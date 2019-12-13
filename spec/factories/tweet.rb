FactoryBot.define do
  factory :tweet do
    tweet      {"test"}
    image      {"img"}
    user_id    {"1"}
    created_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at {"0000-00-00T00:00+00:00"}
    user
    comments
  end
end
