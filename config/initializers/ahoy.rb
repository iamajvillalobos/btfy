class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

# For GDRP compliant
Ahoy.mask_ips = true
Ahoy.cookies = false