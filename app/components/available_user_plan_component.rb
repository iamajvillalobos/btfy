class AvailableUserPlanComponent < ViewComponent::Base
  def initialize(plan:, user:)
    @user = user
    @plan = plan
  end
end
