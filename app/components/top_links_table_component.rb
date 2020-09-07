class TopLinksTableComponent < ViewComponent::Base
  VIEW_LIMIT = 5

  def initialize(links:)
    @links = links
  end

  def links_limit_diff
    VIEW_LIMIT - @links.count
  end
end
