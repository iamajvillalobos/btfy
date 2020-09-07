class TopLinksTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(links:)
    @links = links.map do |link|
      {
        link: link.link,
        count: link.events.count
      }
    end
  end

  def links_limit_diff
    VIEW_LIMIT - @links.count
  end
end
