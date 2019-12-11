FactoryBot.define do
  factory :comment do
    comment      {"test"}
    user_id      {"1"}
    tweet_id     {"1"}
    created_at   {"0000-00-00T00:00+00:00"}
    updated_at   {"0000-00-00T00:00+00:00"}
  end
end
