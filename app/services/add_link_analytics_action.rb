class AddLinkAnalyticsAction
	extend LightService::Action

	expects :link, :ahoy

	executed do |ctx|
		ctx.ahoy.track "Viewed link", link_id: ctx.link.id
	end
end