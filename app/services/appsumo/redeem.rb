module Appsumo
  class Redeem
    extend LightService::Organizer

    def self.call(user, coupon)
      with(
        user: user,
        coupon: coupon
      ).reduce(
        ActivateCoupon,
        MakeLifetimeAccount,
      )
    end
  end
end