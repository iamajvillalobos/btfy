class AvailablePlanComponent < ViewComponent::Base
  def initialize(user:, type:)
    @user = user
    @type = type
  end

  def plan_title
    "#{@type} plan"
  end

  def plan_price
    case @type
    when "monthly"
      5
    when "yearly"
      50
    when "lifetime"
      150
    end
  end

  def plan_savings
    case @type
    when "monthly"
      "Save 0%"
    when "yearly"
      "Save 20%"
    when "lifetime"
      "Unbeatable Value"
    end
  end

  def plan_period
    case @type
    when "monthly"
      "month"
    when "yearly"
      "year"
    when "lifetime"
      "one-time"
    end
  end

  def plan_class
    case @type
    when "lifetime"
      "btn-primary"
    else
      "btn-light"
    end
  end
end
