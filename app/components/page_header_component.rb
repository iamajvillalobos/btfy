class PageHeaderComponent < ViewComponent::Base
	def initialize(pretitle:, title:)
		@pretitle = pretitle
		@title = title
	end
end
