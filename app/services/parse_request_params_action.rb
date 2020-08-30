class ParseRequestParamsAction
	extend LightService::Action

	expects :request
	promises :domain

	executed do |ctx|
		domain = ctx.request.domain
		subdomain = ctx.request.subdomain
		ctx.domain = if subdomain.present?
			"#{subdomain}.#{domain}"
		else
			domain
		end
	end
end