# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.subscribed?
      can [:index, :new, :show, :create, :destroy], Link
      can [:index, :new, :create, :destroy], CustomDomain
    else
      can [:index, :new, :show, :create, :destroy], Link
      can [:index], CustomDomain
    end
  end
end
