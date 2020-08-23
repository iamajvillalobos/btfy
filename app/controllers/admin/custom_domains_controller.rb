class Admin::CustomDomainsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!

  def index
    @pagy, @custom_domains = pagy(CustomDomain.order(created_at: :desc), items: 10)
  end
end
