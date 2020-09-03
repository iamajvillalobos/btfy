class ApiKeysController < ApplicationController
  layout "dashboard"
  
  def index
    @api_keys = current_user.api_keys.order(created_at: :desc)
  end
end