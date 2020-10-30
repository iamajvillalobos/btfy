class CheckDomainConnectionAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    host_domain = ENV.fetch("DEFAULT_URL_HOST")
    domain = ctx.domain.name
    url = "https://4c39cgk3vj.execute-api.us-east-1.amazonaws.com/check_dns"
    params = {
      host_domain: host_domain,
      user_domain: domain
    }

    response = HTTParty.get(url, query: params)

    if !response.success?
      ctx.fail_and_return!("Domain not configured properly.")
    end
  end
end
