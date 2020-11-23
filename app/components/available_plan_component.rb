class AvailablePlanComponent < ViewComponent::Base
  def initialize(user:, plan:)
    @user = user
    @plan = plan
  end

  def plan_title
    "#{@plan.period} plan"
  end

  def plan_price
    @plan.price.floor
  end

  def plan_savings
    case @plan.period
    when "monthly"
      "Save 0%"
    when "yearly"
      "Save 50%"
    when "lifetime"
      "Best Value"
    end
  end

  def plan_period
    @plan.period
  end

  def plan_class
    case @plan.period
    when "lifetime"
      "btn-primary"
    else
      "btn-light"
    end
  end
end
