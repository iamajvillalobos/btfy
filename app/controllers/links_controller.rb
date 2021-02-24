class LinksController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  def index
    @q = current_user.links.ransack(params[:q])
    @links = if params[:tags].present?
      @q.result.order(created_at: :desc).tagged_with(params[:tags])
    else
      @q.result.order(created_at: :desc)
    end
  end

  def show
    @stats = if params[:period].present?
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
      redirect_to result.link
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
        format.html { redirect_to @link, notice: "Link was successfully updated." }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

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
  rescue
    redirect_to root_path, notice: "You don't have access to that link"
  end

  # Only allow a list of trusted parameters through.
  def link_params
    params.require(:link).permit(:destination_url, :name, :slug, :custom_domain_id, :no_tracking, :tag_list)
  end
end
