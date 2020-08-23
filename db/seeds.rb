User.destroy_all
Link.destroy_all
CustomDomain.destroy_all

# Create user
user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")

# Create links
100.times do |i|
  slug = Faker::Internet.slug

  user.links.create!(
    name: slug,
    destination_url: Faker::Internet.url,
    slug: slug
  )
end

# Create Custom Domains
50.times do
  user.custom_domains.create!(name: Faker::Internet.domain_name)
end
