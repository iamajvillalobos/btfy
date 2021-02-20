class Admin::CustomDomainsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def index
    @pagy, @custom_domains = pagy(CustomDomain.order(created_at: :desc))
  end
end
