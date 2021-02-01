module Appsumo
  class ActivateCoupon
    include LightService::Action

    executed do |ctx|
      ctx[:coupon].update(activated: true)
    end
  end
end