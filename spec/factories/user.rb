FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { "password123" }
    trial_ends_at { 30.days.from_now }
  end
end
