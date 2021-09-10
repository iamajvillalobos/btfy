class MarketingPricingPlanComponent < ViewComponent::Base
  def initialize(title:, price:, period:)
    @title = title
    @price = price
    @period = period
  end

  def plan_savings
    case @period
    when "monthly"
      "Save 0%"
    when "yearly"
      "Save 50%"
    when "lifetime"
      "Best Value"
    end
  end

  def plan_period
    if @period == "lifetime"
      "One-time"
    else
      @period
    end
  end

  def card_border
    if @period == "lifetime"
      "border-primary"
    end
  end

  def plan_link
    case @period
    when "month"
      "/monthly"
    when "year"
      "/yearly"
    when "lifetime"
      "/lifetime"
    end
  end
end
