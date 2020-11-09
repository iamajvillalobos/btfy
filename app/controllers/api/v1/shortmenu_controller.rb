class Api::V1::ShortmenuController < ApiController
  def create
    link = current_user.links.new({
      destination_url: params[:destination_url]
    })
    result = CreateLink.call(link)

    if result.success?
      render json: {"shorturl": result[:link].redirect_url}
    else
      render json: {error: result.message}
    end
  end
end
