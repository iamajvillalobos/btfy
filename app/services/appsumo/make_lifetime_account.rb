module Appsumo
  class MakeLifetimeAccount
    include LightService::Action

    executed do |ctx|
      user = ctx[:user]
      lifetime_plan = Plan.find_by(period: "lifetime")
      Pay.subscription_model.create!(
        name: "default",
        owner: user,
        processor: "paddle",
        processor_id: "coupon",
        processor_plan: lifetime_plan.paddle_plan_id,
        quantity: "1",
        status: "active"
      )
      user.update(trial_ends_at: nil)
    end
  end
end
