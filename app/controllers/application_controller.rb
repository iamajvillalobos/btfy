class ApplicationController < ActionController::Base
  include Pagy::Backend

  impersonates :user

  def append_info_to_payload(payload)
    super
    payload[:request_id] = request.uuid
    payload[:user_id] = current_user.id if current_user
  end
end
