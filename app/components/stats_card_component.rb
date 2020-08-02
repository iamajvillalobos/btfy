class StatsCardComponent < ViewComponent::Base
  def initialize(title:, count:)
    @title = title
    @count = count
  end
end
