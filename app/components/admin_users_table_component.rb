class AdminUsersTableComponent < ViewComponent::Base
  def initialize(users)
    @users = users
  end
end
