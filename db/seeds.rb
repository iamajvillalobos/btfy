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

# User plans
UserPlan.create!(name: "Free", interval: "month", register_link: "/free")
UserPlan.create!(
	name: "Monthly",
	interval: "month",
	amount: 5.0,
	register_link: "/monthly",
	paddle_plan_id: 628081
)
UserPlan.create!(
  name: "Yearly",
  interval: "year",
  amount: 50.0,
  register_link: "/yearly",
  paddle_plan_id: 628080
)