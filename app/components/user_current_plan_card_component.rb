class UserCurrentPlanCardComponent < ViewComponent::Base
  def initialize(user:, show_button:)
    @user = user
    @show_button = show_button
  end
end
