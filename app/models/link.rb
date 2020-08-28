class Link < ApplicationRecord
  validates :destination_url, url: true
  validate :unique_slug_per_custom_domain, on: :create
  validates_format_of :slug, with: /\A[a-zA-Z0-9]*\z/, message: "must only be numbers and letters"

  belongs_to :custom_domain, optional: true
  belongs_to :user

  def redirect_url
    Rails.application.routes.url_helpers.redirect_url(
      host: host,
      slug: slug
    )
  end

  private

  def host
    return custom_domain.name if custom_domain
    Rails.application.routes.default_url_options[:host]
  end

  def unique_slug_per_custom_domain
    link = if custom_domain
      custom_domain.links.find_by(slug: slug)
    else
      Link.find_by(slug: slug, custom_domain: nil)
    end

    if link
      errors.add(:slug, "must be unique")
    end
  end
end
