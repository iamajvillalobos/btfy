class RedirectLinksController < ApplicationController
	def new
		link = Link.find_by(slug: params[:slug])
		ahoy.track "Viewed link", link_id: link.id
		redirect_to link.destination_url
	end
end