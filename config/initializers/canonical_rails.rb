# Do yourself a favor and set these up right when you install the engine.

CanonicalRails.setup do |config|
  config.protocol = 'https://'
  config.host = 'btfy.io'
  config.collection_actions = [:index]
  config.allowed_parameters = []
  config.opengraph_url = true
end
