class NavbarComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper

  def initialize(current_user:)
    @current_user = current_user
  end

  def active_link(current_path)
    if current_page?(current_path)
      "text-green-500"
    else
      "text-gray-500"
    end
  end
end
