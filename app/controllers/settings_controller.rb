class SettingsController < ApplicationController
  layout "dashboard"

  def show
    @domains = current_user.custom_domains
  end
end
