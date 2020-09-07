class ReferrerDomain
  URL_TO_DOMAIN = {
    "t.co" => "Twitter",
    "l.facebook.com" => "Facebook",
    "m.facebook.com" => "Facebook",
    "l.messenger.com" => "Facebook",
    "www.facebook.com" => "Facebook"
  }

  attr_reader :name

  def initialize(url:)
    @name = url ? parse_domain(url) : "Direct"
  end

  def parse_domain(url)
    return url unless URL_TO_DOMAIN.keys.include?(url)
    URL_TO_DOMAIN[url]
  end
end