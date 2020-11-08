class CustomDomainStatusIconComponent < ViewComponent::Base
  def initialize(custom_domain)
    @custom_domain = custom_domain
  end
end
