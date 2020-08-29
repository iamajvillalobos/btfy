FactoryBot.define do
  factory :link do
    destination_url { Faker::Internet.url }
    name { Faker::Internet.domain_word }
    slug { SecureRandom.alphanumeric(5) }
    user
  end
end
