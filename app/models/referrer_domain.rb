class ReferrerDomain
  URL_TO_DOMAIN = {
    "t.co" => "Twitter",
    "l.facebook.com" => "Facebook",
    "m.facebook.com" => "Facebook",
    "l.messenger.com" => "Facebook",
    "www.facebook.com" => "Facebook",
    "lm.facebook.com" => "Facebook",
    "l.instagram.com" => "Instagram"
  }

  attr_reader :name

  def initialize(url:)
    host = host_or_path(url)
    @name = host ? parse_domain(host) : "Direct / None"
  end

  def parse_domain(url)
    return url unless URL_TO_DOMAIN.keys.include?(url)
    URL_TO_DOMAIN[url]
  end

  def host_or_path(url)
    return if url.nil?
    uri = Addressable::URI.parse(url)
    uri.host || uri.path.split("/").first
  end
end
