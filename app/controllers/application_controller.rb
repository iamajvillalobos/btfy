class ApplicationController < ActionController::Base
  include Pagy::Backend

  impersonates :user

  rescue_from CanCan::AccessDenied do
    flash[:notice] = "You must be a paid account to access this. Please choose a plan below."
    redirect_to subscriptions_path
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if current_user
  end
end
