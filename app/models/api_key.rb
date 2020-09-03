class ApiKey < ApplicationRecord
  belongs_to :user
  validates_presence_of :key, :client_name
  validate :only_one_active_key_allowed

  private
  
  def only_one_active_key_allowed
    active_api_keys = ApiKey.where(user_id: user_id, deactivated_at: nil)

    return if active_api_keys.empty?

    if active_api_keys && !active_api_keys.include?(self)
      errors.add(:api_key, "can't have more than one active")
    end
  end
end
