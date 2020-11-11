class AdminLinkVisitsTableComponent < ViewComponent::Base
  def initialize(link_visits, pagy)
    @link_visits = link_visits
    @pagy = pagy
  end
end
