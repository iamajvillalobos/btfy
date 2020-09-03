class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      if api_key = ApiKey.find_by(key: token, deactivated_at: nil)
        ActiveSupport::SecurityUtils.secure_compare(token, api_key.key)
      end

      api_key.user if api_key
    end
  end

  def current_user
    @current_user ||= authenticate
  end
end