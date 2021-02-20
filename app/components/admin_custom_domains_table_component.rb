class AdminCustomDomainsTableComponent < ViewComponent::Base
  def initialize(custom_domains, pagy)
    @custom_domains = custom_domains
    @pagy = pagy
  end
end
