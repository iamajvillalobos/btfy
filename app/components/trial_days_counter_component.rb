class TrialDaysCounterComponent < ViewComponent::Base
  def initialize(user: @user)
    @user = user
  end

  def render?
    @user.on_generic_trial?
  end

  def trial_days_left
    time_ago = time_ago_in_words(@user.trial_ends_at)

    case time_ago
    when "about 1 month"
      "30 trial days"
    else
      if time_ago.include?("about")
        time_ago.split[1..-1].join(" trial ")
      else
        time_ago.split.join(" trial ")
      end
    end
  end
end
