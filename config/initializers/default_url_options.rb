host = ENV["DEFAULT_URL_HOST"]

protocol = Rails.application.config.force_ssl ? "https" : "http"

Rails.application.routes.default_url_options.merge!(
  host: host,
  protocol: protocol
)