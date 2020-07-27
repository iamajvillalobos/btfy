class Link < ApplicationRecord
	def redirect_url
		Rails.application.routes.url_helpers.redirect_url(
			host: "http://localhost:3000",
			slug: slug
		)
	end
end
