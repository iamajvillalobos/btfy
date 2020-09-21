namespace :referrer do
  task clean: :environment do
    LinkVisit.find_each do |link_visit|
      puts "Before: #{link_visit.referrer}"
      updated_referrer = ReferrerDomain.new(url: link_visit.referrer).name
      link_visit.update(referrer: updated_referrer)
      puts "After: #{updated_referrer}"
    end
  end
end

