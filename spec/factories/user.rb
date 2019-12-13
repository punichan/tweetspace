FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    avater                 {"img"}
    sequence(:name)        {Faker::Name.last_name}
    password               { password }
    password_confirmation  { password }
    sequence(:email)       {Faker::Internet.email}
    created_at             {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
  end
end
