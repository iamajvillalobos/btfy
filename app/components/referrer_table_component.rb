class ReferrerTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(visits:, uniques:, label:)
    @visits = visits.sort_by { |k, v| v }.reverse.first(VIEW_LIMIT).to_h
    @uniques = @visits.map { |key, val| [key, uniques[key]] }.to_h

    @stats = generate_stats
    @label = label
  end

  def stats_limit_diff
    VIEW_LIMIT - @stats.count
  end

  private

  def generate_stats
    stats = {}

    @visits.each do |key, value|
      stats[key] = {visits: value}
    end

    @uniques.each do |key, value|
      stats[key].merge!({uniques: value})
    end

    stats
  end
end
