class CustomDomain < ApplicationRecord
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :links, dependent: :destroy
  belongs_to :user
end
