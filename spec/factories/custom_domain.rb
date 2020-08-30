FactoryBot.define do
  factory :custom_domain do
    name { "custom.domain" }
    user
  end
end