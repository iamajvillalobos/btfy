class AvailableUserPlanComponent < ViewComponent::Base
  def initialize(plan:)
    @plan = plan
  end
end
