class LinksTableComponent < ViewComponent::Base
  def initialize(links, q)
    @links = links
    @q = q
  end
end
