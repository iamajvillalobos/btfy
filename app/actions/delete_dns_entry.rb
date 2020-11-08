# frozen_string_literal: true

class DeleteDnsEntry
  extend ::LightService::Action

  expects :custom_domain

  executed do |ctx|
    heroku = PlatformAPI.connect_oauth(ENV["HEROKU_TOKEN"])
    begin
      heroku.domain.info(ENV["HEROKU_APP_NAME"], ctx.custom_domain.name)
    rescue Excon::Error::NotFound
      ctx.fail_and_return!("No DNS entry for this domain. Please contact support.")
    end
    heroku.domain.delete(ENV["HEROKU_APP_NAME"], ctx.custom_domain.name)
  end
end
