class CheckDnsStatus
  def self.call(domain)
    heroku = PlatformAPI.connect_oauth(ENV["HEROKU_TOKEN"])
    response = heroku.domain.info(ENV["HEROKU_APP_NAME"], domain.name)
    dns_response = OpenStruct.new(response)
    dns_response.acm_status
  end
end
