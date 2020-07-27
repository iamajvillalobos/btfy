class LinkStatsViewerAction
	include LightService::Action
	expects :link
	promises :visit_count

	executed do |ctx|
		ctx.visit_count = Ahoy::Event.where_props(link_id: ctx.link.id)
			.distinct
			.pluck(:visit_id)
			.count
	end
end