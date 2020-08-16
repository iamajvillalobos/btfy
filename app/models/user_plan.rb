class UserPlan < ApplicationRecord
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

  def interval_text
    case name
    when "3-year plan"
      "every 3 years"
    when "2-year plan"
      "every 2 years"
    when "1-year plan"
      "every year"
    else
      "every month"
    end
  end

  def monthly_value
    case name
    when "3-year plan"
      amount / 36
    when "2-year plan"
      amount / 24
    when "1-year plan"
      amount / 12
    else
      amount
    end
  end
end