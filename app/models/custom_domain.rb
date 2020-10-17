class CustomDomain < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name
  validates :redirect_url, url: true

  has_many :links, dependent: :destroy
  belongs_to :user

  enum status: {
    pending: 0,
    success: 1,
    failed: 2
  }
end
