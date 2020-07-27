class CustomDomain < ApplicationRecord
	validates_uniqueness_of :name

	has_many :links, dependent: :nullify
	belongs_to :user
end
