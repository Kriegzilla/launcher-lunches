require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :lunch do
    location { Faker::Address.street_name }
    category Lunch::CATEGORIES.sample
    price "$" * [1,2,3,4,5].sample
    date (Date.today + 2).strftime("%Y-%m-%d")
    time { Time.now.strftime("%I:%m") }
    description { Faker::Lorem.paragraph(2, false, 4) }
    name { Faker::Team.name }
  end
end
