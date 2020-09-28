class AdminController < ApplicationController
  before_action :authenticate_admin_user!
  skip_authorization_check
end