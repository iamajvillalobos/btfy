class CurrentPlanComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def plan_rate
    if @user.free_plan?
      "Free"
    else
      "$5/mo"
    end
  end
end
