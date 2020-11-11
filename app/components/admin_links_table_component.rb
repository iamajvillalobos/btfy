class AdminLinksTableComponent < ViewComponent::Base
  def initialize(links, pagy)
    @links = links
    @pagy = pagy
  end
end
