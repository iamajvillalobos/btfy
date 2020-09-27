class User < ApplicationRecord
  include Pay::Billable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable,
    :validatable

  validates :username, uniqueness: true

  has_many :links, dependent: :destroy
  has_many :custom_domains, dependent: :destroy
  has_many :api_keys, dependent: :destroy
  has_many :link_visits
  has_one :account, dependent: :destroy
  has_one :public_profile, dependent: :destroy

  # after_create :enable_trial

  def account
    Account.find_or_create_by(user: self)
  end

  def free_plan?
    return false if subscribed?
    return false if on_generic_trial?
    true
  end

  def admin?
    id == 1 && email == "hello@ajvillalobos.com"
  end

  def username_or_email
    username || email
  end

  private

  def enable_trial
    update(trial_ends_at: 30.days.from_now)
  end
end
