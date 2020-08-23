class GenerateLinkNameAction
  extend LightService::Action

  promises :name

  executed do |ctx|
    ctx.name = if ctx[:link].name.blank?
      ctx[:link].destination_url.truncate(255)
    else
      ctx[:link].name
    end
  end
end
