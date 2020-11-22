class ApiController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate

  private

  def authenticate
    landing_page_user = ENV["LANDING_PAGE_USER_API"]

    if request.env["HTTP_AUTHORIZATION"].nil?
      api_key = ApiKey.find_by(key: landing_page_user, deactivated_at: nil)
      return api_key.user
    end

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