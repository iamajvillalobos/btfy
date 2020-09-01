class Account < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :avatar, attached: true,
    content_type: ['image/png', 'image/jpg', 'image/jpeg'],
    size: { less_than: 5.megabytes, message: 'is too big. We only allow less than 5mb.' }

  def image
    avatar.attached? ? avatar : GetGravatarLinkAction.execute(email: user.email).image_src
  end
end
