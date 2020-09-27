class CurrentPlanComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def plan_rate
    if @user.free_plan?
      "Free"
    elsif @user.subscription.cancelled?
      "Free"
    else
      "$#{@user.subscription_plan.price.floor}/mo"
    end
  end
end
