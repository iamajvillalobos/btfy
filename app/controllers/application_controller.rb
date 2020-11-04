class ApplicationController < ActionController::Base
  before_action :set_raven_context

  include Pagy::Backend
  check_authorization :unless => :devise_controller?

  impersonates :user

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        flash[:notice] = "You must have an active subscription. Please choose from the plans below."
        redirect_to billing_path
      end
    end
  end

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if current_user
  end

  def set_raven_context
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
