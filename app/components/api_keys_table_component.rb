class ApiKeysTableComponent < ViewComponent::Base
  def initialize(api_keys)
    @api_keys = api_keys
  end
end
