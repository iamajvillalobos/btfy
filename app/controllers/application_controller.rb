class ApplicationController < ActionController::Base
	skip_before_action :track_ahoy_visit
end
