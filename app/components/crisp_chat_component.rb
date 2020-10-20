class CrispChatComponent < ViewComponent::Base
  def render?
    Rails.env.production?
  end
end
