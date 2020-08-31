class LinkStatCardComponent < ViewComponent::Base
  def initialize(stats:, label:)
    @stats = stats
    @label = label
  end
end
