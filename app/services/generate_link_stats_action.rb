class GenerateLinkStatsAction
  extend LightService::Action

  expects :link

  executed do |ctx|
    range = Date.today.beginning_of_month..Date.today.end_of_month

    rand(100).times.each do |time|
      date = range.to_a.sample
      Timecop.freeze(date) do
        puts "creating event for #{date}"
        request = OpenStruct.new(
          params: { },
          referer: Faker::Internet.url,
          remote_ip: Faker::Internet.public_ip_v4_address,
          user_agent: Faker::Internet.user_agent,
          original_url: Rails.application.routes.url_helpers.root_url,
        )

        visit_properties = Ahoy::VisitProperties.new(request, api: nil)
        properties = visit_properties.generate.select { |_, v| v }

        example_visit = Ahoy::Visit.create!(properties.merge(
          visit_token: SecureRandom.uuid,
          visitor_token: SecureRandom.uuid,
          started_at: Time.current
        ))

        example_event = Ahoy::Event.create!(
          visit: example_visit,
          name: 'example_event',
          properties: {"link_id" => ctx.link.id},
          time: Time.current
        )
      end
    end
  end
end