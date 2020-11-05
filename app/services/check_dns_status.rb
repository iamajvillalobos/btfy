class CheckDnsStatus
  def self.call(domain)
    url = "https://api.heroku.com/apps/#{ENV["HEROKU_APP_NAME"]}/domains/#{domain.name}"
    options = {
      body: {
        hostname: domain.name
      },
      headers: {
        "Accept": "application/vnd.heroku+json; version=3",
        "Authorization": "Basic #{ENV["HEROKU_API_KEY"]}"
      }
    }
    response = HTTParty.get(url, options)
    return unless response.success?

    dns_response = OpenStruct.new(response.parsed_response)
    dns_response.acm_status
  end
end
