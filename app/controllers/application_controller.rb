class ApplicationController < ActionController::Base
	skip_before_action :track_ahoy_visit

  rescue_from CanCan::AccessDenied do
    redirect_to main_app.root_url,
    notice: "You must subscribe to plan to do this action"
  end
end
