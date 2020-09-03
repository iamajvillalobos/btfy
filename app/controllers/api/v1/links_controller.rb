class Api::V1::LinksController < ApiController
  def create
    link = current_user.links.new(link_params)
    result = CreateLink.call(link)

    if result.success?
      render json: { link: result[:link] }
    else
      render json: { error: result.message }
    end
  end

  private

  def link_params
    params.require(:link).permit(:destination_url, :name, :slug, :custom_domain_id)
  end
end