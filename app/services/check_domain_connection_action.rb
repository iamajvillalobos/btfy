class CheckDomainConnectionAction
  extend LightService::Action

  expects :domain

  executed do |ctx|
    cname_entry = ""

    begin
      cname_entry = Resolv::DNS.open { |dns|
        dns.getresource(ctx.domain.name, Resolv::DNS::Resource::IN::CNAME)
      }.name.to_s
    rescue Resolv::ResolvError => e
      ctx.fail_and_return!(e)
    end

    if cname_entry != ENV.fetch("DEFAULT_URL_HOST")
      ctx.fail_and_return!("Domain not configured properly.")
    end
  end
end
