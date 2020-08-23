class AdminCustomDomainsTableComponent < ViewComponent::Base
  def initialize(custom_domains)
    @custom_domains = custom_domains
  end
end
