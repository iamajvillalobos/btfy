FactoryBot.define do
  factory :api_key do
    key { SecureRandom.uuid }
    client_name { Faker::Company.unique.name }    
  end
end
