namespace :user do
  task attach_link_visit: :environment do
    users = User.all
    users.each do |user|
      puts "Processing #{user.email}"

      links = user.links
      puts "Processing #{links.count} links"
      links.each do |link|
        link_visits = link.visits
        puts "Processing #{link_visits.count} link visits"
        link_visits.each { |lv| lv.update(user: user) }
      end
      puts "Done..."
    end
  end
end


users.each do |user|
  puts "User #{user.email} has #{user.link_visits.count} click visits"
end