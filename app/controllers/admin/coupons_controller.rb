class Admin::CouponsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @coupons = Coupon.all
  end

end