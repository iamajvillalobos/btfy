class CustomDomainsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_custom_domain, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @domains = current_user.custom_domains
  end

  def new
    @custom_domain = current_user.custom_domains.new
  end

  def edit
  end

  def create
    @custom_domain = current_user.custom_domains.new(custom_domain_params)
    result = CreateCustomDomain.call(@custom_domain)

    if result.success?
      redirect_to custom_domain_setup_dns_path(@custom_domain)
    else
      flash.now[:error] = result.message
      render :new
    end
  end

  def update
    respond_to do |format|
      if @custom_domain.update(custom_domain_params)
        format.html { redirect_to custom_domains_path, notice: "Custom domain was successfully updated." }
        format.json { render :show, status: :ok, location: @custom_domain }
      else
        format.html { render :edit }
        format.json { render json: @custom_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    result = DeleteCustomDomain.call(@custom_domain)
    if result.success?
      redirect_to custom_domains_path, notice: "Custom domain was deleleted"
    else
      redirect_to custom_domains_path, error: result.message
    end
  end

  def setup_dns
    @custom_domain = CustomDomain.find(params[:custom_domain_id])
  end

  private

  def set_custom_domain
    @custom_domain = current_user.custom_domains.find(params[:id])
  end

  def custom_domain_params
    params.require(:custom_domain).permit(:name, :redirect_url, :not_found_url)
  end
end
