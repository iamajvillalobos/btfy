# frozen_string_literal: true

class RedirectLink
  extend ::LightService::Organizer

  def self.call(link)
    with(link: link.link).reduce(actions)
  end

  def self.actions
    [
      ValidateUrl,
      RedirectUrl
    ]
  end
end
