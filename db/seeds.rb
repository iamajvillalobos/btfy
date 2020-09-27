User.destroy_all
Link.destroy_all
CustomDomain.destroy_all

# Create AdminUser
admin_user = AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password")

# Create user
user = User.create!(email: "test@example.com", password: "password", password_confirmation: "password")

# Create links
50.times do |i|
  slug = Faker::Internet.slug

  user.links.create!(
  	name: "Link#{i}",
    destination_url: Faker::Internet.url,
    slug: SecureRandom.alphanumeric(5)
  )
end

# Create Custom Domains
10.times do
  user.custom_domains.create!(name: Faker::Internet.domain_name)
end

# Create Plans
Plan.create!(period: "monthly", price: 5, paddle_plan_id: "631104")
Plan.create!(period: "yearly", price: 50, paddle_plan_id: "631105")
Plan.create!(period: "lifetime", price: 150, paddle_plan_id: "631107")