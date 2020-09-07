class ImpersonateBannerComponent < ViewComponent::Base
  def initialize(current_user:, true_user:)
    @current_user = current_user
    @true_user = true_user
  end

  def render?
    @current_user != @true_user
  end
end
