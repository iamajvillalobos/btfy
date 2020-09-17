class TopLinksTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(links:)
    @links = links.map do |link|
      {
        link: link.link,
        visits: link.visits.count,
        unique_visits: link.unique_visits.count
      }
    end
  end

  def links_limit_diff
    VIEW_LIMIT - @links.count
  end
end
