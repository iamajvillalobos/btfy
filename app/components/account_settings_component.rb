class AccountSettingsComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  def account
    @user.account
  end
end
