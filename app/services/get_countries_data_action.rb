class GetCountriesDataAction
  extend LightService::Action

  expects :events
  promises :countries

  COUNTRY_SHORT_NAME = {
    "United States of America" => "USA",
    "United Kingdom of Great Britain and Northern Ireland" => "UK",
    "United Arab Emirates" => "UAE",
    "Korea (Republic of)" => "South Korea"
  }

  executed do |ctx|
    countries = ctx.events.map do |event|
      country = ISO3166::Country.new(event.visit.country)
      next if country.nil?
      parse_name(country.name)
    end

    ctx.countries = countries.tally.delete_if { |k, v| k.nil? }
  end

  def self.parse_name(name)
    return name unless COUNTRY_SHORT_NAME.keys.include?(name)
    COUNTRY_SHORT_NAME[name]
  end
end