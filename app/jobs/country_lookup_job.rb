class CountryLookupJob < ApplicationJob
  queue_as :default

  def perform(ip, visit_id)
    # get country details
    url = "https://ipapi.co/#{ip}/country/"
    result = HTTParty.get(url)
    country_code = result.body
    country_name = ISO3166::Country.new(country_code).name

    # update link visit country
    visit = LinkVisit.find(visit_id)
    visit.update(country: country_name)
  end
end
