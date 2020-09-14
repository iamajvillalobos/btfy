class Admin::CustomDomainsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @custom_domains = CustomDomain.order(created_at: :desc)
  end
end
