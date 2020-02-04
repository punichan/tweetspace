FactoryBot.define do
  factory :tweet do
    tweet      {Faker::Name.last_name}
    image      { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')) }
    food       {Faker::Dessert.flavor}
    price      {1000}
    store      {Faker::Dessert.flavor}
    created_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    updated_at {Faker::Time.between(from: DateTime.now - 9, to: DateTime.now) }
    place_id   {1}
    category_id{1}
    user

  end
end
