class PageHeaderWithButtonComponent < ViewComponent::Base
	def initialize(pretitle:, title:, btn_link:, btn_text:)
		@pretitle = pretitle
		@title = title
		@btn_link = btn_link
		@btn_text = btn_text
	end
end
