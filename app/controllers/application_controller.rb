class ApplicationController < ActionController::Base
	skip_before_action :track_ahoy_visit
  include Pagy::Backend

  rescue_from CanCan::AccessDenied do
    redirect_to user_plans_url,
    notice: "You must subscribe to plan to do this action"
  end
end
