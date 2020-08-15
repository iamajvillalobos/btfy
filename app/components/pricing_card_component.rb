class PricingCardComponent < ViewComponent::Base
  def initialize(plan:)
    @plan = plan
  end

  def monthly_total
    monthly_amount = UserPlan.find_by(name: "1-month plan").amount

    case name
    when "3-year plan"
      monthly_amount * 36
    when "2-year plan"
      monthly_amount * 24
    when "1-year plan"
      monthly_amount * 12
    else
      monthly_amount
    end
  end
end
