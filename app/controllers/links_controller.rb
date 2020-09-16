class LinksController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @links = current_user.links.order(created_at: :desc)
  end

  def show
    @stats = if params[:period].present?
      GetLinkStats.call(@link, params[:period])
    else
      GetLinkStats.call(@link, "7d")
    end

    @visit_stats = if params[:period].present?
      GetVisitStats.call(@link, params[:period])
    else
      GetVisitStats.call(@link, "7d")
    end
  end

  def new
    @link = current_user.links.new
  end

  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = current_user.links.new(link_params)
    result = CreateLink.call(@link)

    if result.success?
      redirect_to links_path, notice: "Link was successfully created."
    else
      flash.now[:error] = result.message
      render :new
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to links_path, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: "Link was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_link
    @link = current_user.links.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:destination_url, :name, :slug, :custom_domain_id)
  end
end
