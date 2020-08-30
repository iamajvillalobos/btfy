unless Rails.env.test?
  LightService::Configuration.logger = Logger.new(STDOUT)
end