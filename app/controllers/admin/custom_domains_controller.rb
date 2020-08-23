class Admin::CustomDomainsController < ApplicationController
  layout "admin"

  def index
    @pagy, @custom_domains = pagy(CustomDomain.order(created_at: :desc), items: 10)
  end
end
