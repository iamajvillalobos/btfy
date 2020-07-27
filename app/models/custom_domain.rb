class CustomDomain < ApplicationRecord
	validates_uniqueness_of :name
end
