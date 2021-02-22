class TagListComponent < ViewComponent::Base
  def initialize(link)
    @link = link
  end

  def render?
    @link.tag_list.any?
  end
end
