class CurrentPlanComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def plan_rate
    if @user.free_plan?
      "Free"
    elsif @user.lifetime_deal_plan?
      "Lifetime Deal"
    elsif @user.subscription_plan.period == "monthly"
      "$#{@user.subscription_plan.price.floor}/month"
    elsif @user.subscription_plan.period == "yearly"
      "$#{@user.subscription_plan.price.floor}/year"
    else
      "$#{@user.subscription_plan.price.floor}"
    end
  end
end
