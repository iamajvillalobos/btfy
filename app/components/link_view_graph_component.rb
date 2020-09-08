class LinkViewGraphComponent < ViewComponent::Base
  def initialize(visits)
    @visits = visits[:visits]
  end
end
