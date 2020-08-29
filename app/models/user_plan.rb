class UserPlan < ApplicationRecord
  def price
    amount.to_i
  end

  def per_text
    case name
    when "Monthly"
      "/ mo"
    when "Yearly"
      "/ yr"
    else
      ""
    end
  end

  def price_with_per_text
    "$#{price} #{per_text}"
  end

  def links_limit
    name == "Free" ? Ability::MAX_LINKS_FOR_FREE_USER : "Unlimited"
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

  def dashboard_access
    name == "Free" ? "No" : "Yes"
  end
end
