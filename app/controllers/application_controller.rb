class ApplicationController < ActionController::Base
	skip_before_action :track_ahoy_visit
  include Pagy::Backend

  rescue_from CanCan::AccessDenied do
    flash[:notice] = "You must subscribe to plan to do this action"
    redirect_to subscriptions_path
  end
end
