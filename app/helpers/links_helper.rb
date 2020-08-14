module LinksHelper
	def stacked_chart_data
		[
			{
				name: "Visit",
				data: @stats.visit_count_grouped,
			},
			{
				name: "Unique Visit",
				data: @stats.unique_visit_count_grouped,
			}
		]
	end

	def no_domains
		current_user.custom_domains.count == 0
	end
end
