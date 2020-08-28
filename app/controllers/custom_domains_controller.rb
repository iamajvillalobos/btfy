class CustomDomainsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_custom_domain, only: [:show, :edit, :update, :destroy]

  def index
    @domains = current_user.custom_domains
  end

  def show
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
      redirect_to custom_domains_path, notice: "Domain added successfully."
    else
      flash.now[:error] = result.message
      render :new
      return
    end
  end

  def update
    respond_to do |format|
      if @custom_domain.update(custom_domain_params)
        format.html { redirect_to @custom_domain, notice: "Custom domain was successfully updated." }
        format.json { render :show, status: :ok, location: @custom_domain }
      else
        format.html { render :edit }
        format.json { render json: @custom_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @custom_domain.destroy
    respond_to do |format|
      format.html { redirect_to custom_domains_path, notice: "Custom domain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_custom_domain
    @custom_domain = current_user.custom_domains.find(params[:id])
  end

  def custom_domain_params
    params.require(:custom_domain).permit(:name, :redirect_url)
  end
end
