class Link < ApplicationRecord
  validates :destination_url, url: true
  validate :unique_slug_per_custom_domain, on: :create
  validates_format_of :slug, with: /\A[a-zA-Z0-9--]*\z/, message: "must only be numbers, letters and dash"

  belongs_to :custom_domain, optional: true
  belongs_to :user
  belongs_to :public_profile, optional: true

  has_many :visits, class_name: "LinkVisit", dependent: :destroy

  def redirect_url
    Rails.application.routes.url_helpers.redirect_url(
      host: host,
      slug: slug
    )
  end

  def as_json(options={})
    options[:methods] ||= [:redirect_url]
    options[:except] ||= [:public_profile_id, :user_id]

    super(options)
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
