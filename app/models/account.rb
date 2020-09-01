class Account < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 5.megabytes, message: 'is too big' }

  def image
    avatar.attached? ? avatar : GetGravatarLinkAction.execute(email: user.email).image_src
  end
end
