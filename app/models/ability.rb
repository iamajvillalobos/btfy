# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.subscription&.active? || user.on_generic_trial?
      can :manage, :all
    end
  end
end
