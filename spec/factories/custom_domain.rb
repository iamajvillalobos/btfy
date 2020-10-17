FactoryBot.define do
  factory :custom_domain do
    name { "custom.domain" }
    redirect_url { "http://lvh.me" }
    not_found_url { "http://lvh.me" }
    user
  end
end
