# frozen_string_literal: true

class Ability
  include CanCan::Ability

  MAX_LINKS_FOR_FREE_USER = 5

  def initialize(user)
    can :manage, :all
  end
end
