class CustomDomainsController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_custom_domain, only: [:show, :edit, :update, :destroy]

  # GET /custom_domains
  # GET /custom_domains.json
  def index
    @custom_domains = current_user.custom_domains
  end

  # GET /custom_domains/1
  # GET /custom_domains/1.json
  def show
  end

  # GET /custom_domains/new
  def new
    @custom_domain = current_user.custom_domains.new
  end

  # GET /custom_domains/1/edit
  def edit
  end

  # POST /custom_domains
  # POST /custom_domains.json
  def create
    @custom_domain = current_user.custom_domains.new(custom_domain_params)

    respond_to do |format|
      if @custom_domain.save
        format.html { redirect_to custom_domains_path, notice: "Custom domain was successfully created." }
        format.json { render :show, status: :created, location: @custom_domain }
      else
        format.html { render :new }
        format.json { render json: @custom_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custom_domains/1
  # PATCH/PUT /custom_domains/1.json
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

  # DELETE /custom_domains/1
  # DELETE /custom_domains/1.json
  def destroy
    @custom_domain.destroy
    respond_to do |format|
      format.html { redirect_to settings_path, notice: "Custom domain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_custom_domain
    @custom_domain = current_user.custom_domains.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def custom_domain_params
    params.require(:custom_domain).permit(:name, :redirect_url)
  end
end
