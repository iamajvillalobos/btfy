class FetchTotalCountriesAction
  include LightService::Action

  expects :links_with_stats
  promises :total_countries

  executed do |ctx|
    countries = {}

    ctx.links_with_stats.each do |link|
      country = link.countries
      countries.merge!(country) { |_, old_val, new_val| old_val + new_val }
    end

    ctx.total_countries = countries
  end
end