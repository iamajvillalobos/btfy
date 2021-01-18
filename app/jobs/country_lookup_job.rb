class CountryLookupJob < ApplicationJob
  queue_as :default

  def perform(ip, visit_id)
    # initialize client
    client = MaxMind::GeoIP2::Client.new(
      account_id: ENV["GEOLITE_USER_ID"],
      license_key: ENV["GEOLITE_LICENSE_KEY"],
      host: "geolite.info"
    )

    # fetch country details from IP
    record = client.country(ip)
    country = record.country.name

    # update link visit country
    visit = LinkVisit.find(visit_id)
    visit.update(country: country)
  end
end
