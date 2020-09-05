# frozen_string_literal: true

class Ability
  include CanCan::Ability

  MAX_LINKS_FOR_FREE_USER = 5

  def initialize(user)
    if user.subscribed? || user.on_generic_trial?
      can :manage, :all
      can :read, :dashboard
    else
      can [:index, :new, :create, :edit, :update], Link
    end
  end
end
