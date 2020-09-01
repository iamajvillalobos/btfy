class SettingsHeaderComponent < ViewComponent::Base
  def active_link(current_path)
    if current_page?(current_path)
      "nav-link active"
    else
      "nav-link"
    end
  end
end
