class AdminPlansTableComponent < ViewComponent::Base
  def initialize(plans)
    @plans = plans
  end
end
