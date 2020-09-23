class LinkVisit < ApplicationRecord
  belongs_to :link
  belongs_to :user
end
