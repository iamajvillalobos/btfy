class CountryLookupJob < ApplicationJob
  queue_as :default

  def perform(ip, visit_id)
    url = "http://api.ipstack.com/#{ip}?access_key=#{ENV['IPSTACK_API_KEY']}"
    response = ::HTTParty.get(url)
    visit = LinkVisit.find(visit_id)
    visit.update(country: response["country_name"])
  end
end
