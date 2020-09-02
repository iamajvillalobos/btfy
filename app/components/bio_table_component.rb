class BioTableComponent < ViewComponent::Base
  def initialize(links, pagy, public_profile_links)
    @links = links
    @pagy = pagy
    @public_profile_links = public_profile_links
  end
end
