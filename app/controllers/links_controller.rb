class LinksController < ApplicationController
  layout "dashboard"

  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  authorize_resource

  def index
    @pagy, @links = pagy(current_user.links.order(created_at: :desc), items: 10)
  end

  def show
    @stats = LinkStatsViewerAction.execute(link: @link)
  end

  def new
    if !current_user.subscribed? &&
        current_user.links.count >= Ability::MAX_LINKS_FOR_FREE_USER
      flash[:notice] = "You already reach the max amount of links. Please choose a plan below."
      redirect_to subscriptions_path
    end
    
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
