require_relative "boot"
require "view_component/engine"
require "rails/all"
require "resolv"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Btfy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Use sidekiq as active job adapter
    config.active_job.queue_adapter = :sidekiq

    # Customize error pages routes
    config.exceptions_app = routes

    config.middleware.use Rack::Attack
  end
end
