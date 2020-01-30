FactoryBot.define do
  factory :user do
    avater                 {Faker::Avatar.image}
    sequence(:name)        {Faker::Name.last_name}
    profile                {Faker::Name.last_name}
    password               {"password"}
    password_confirmation  {"password" }
    sequence(:email)       {Faker::Internet.email}
    created_at             {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
  end
end
