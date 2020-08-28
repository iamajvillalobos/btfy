class AvailableUserPlansComponent < ViewComponent::Base
  def initialize(plans:, user:)
    @plans = plans
    @user = user
  end
end
