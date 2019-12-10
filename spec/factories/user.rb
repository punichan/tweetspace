FactoryBot.define do
  factory :user do
    avater                 {"img"}
    name                   {"test"}
    email                  {"test@test"}
    password               {"testtest"}
    password_confirmation  {"testtest"}
  end
end
