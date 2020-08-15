class BillingsController < ApplicationController
	before_action :authenticate_user!

  layout "dashboard"

  def show
    @hello = "hello"
  end
end