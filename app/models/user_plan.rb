class UserPlan < ApplicationRecord
  def price
    amount.to_i
  end

  def links_limit
    name == "Free" ? 5 : "Unlimited"
  end

  def custom_slug_limit
    name == "Free" ? 0 : "Unlimited"
  end

  def custom_domains_limit
    name == "Free" ? 0 : "Unlimited"
  end

  def analytics_limit
    name == "Free" ? "Basic" : "All Access"
  end
end