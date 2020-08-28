class ApplicationController < ActionController::Base
	skip_before_action :track_ahoy_visit
  include Pagy::Backend

  rescue_from CanCan::AccessDenied do
    flash[:notice] = "You must be a paid account to access this. Please choose a plan below."
    redirect_to subscriptions_path
  end
end
