class LinkStatsViewerAction
	include LightService::Action
	expects :link
	promises :unique_visit_count,
		:unique_visit_count_grouped,
		:visit_count,
		:visit_count_grouped,
		:devices,
		:browsers,
		:countries

	executed do |ctx|
		events = Ahoy::Event.where_props(link_id: ctx.link.id)
		uniq_events = events.uniq(&:visit_id)

		ctx.unique_visit_count = events.distinct.pluck(:visit_id).count
		ctx.unique_visit_count_grouped = uniq_events.group_by_day(:time).count
		ctx.visit_count = events.pluck(:visit_id).count
		ctx.visit_count_grouped = events.group_by_day(:time).count
		ctx.devices = uniq_events.map { |e| e.visit.device_type }.tally
		ctx.browsers = uniq_events.map { |e| e.visit.browser }.tally
		ctx.countries = uniq_events.map { |e| e.visit.country }.tally
	end
end