class ApiKey < ApplicationRecord
  belongs_to :user
  validates_presence_of :client_name, :key
  validate :only_one_active_key_allowed

  private
  
  def only_one_active_key_allowed
    if ApiKey.where(user_id: user_id, deactivated_at: nil)
      errors.add(:api_key, "can't have more than one active")
    end
  end
end
