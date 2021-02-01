class User < ApplicationRecord
  include Pay::Billable
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :confirmable

  validates :username, uniqueness: true

  has_many :links, dependent: :destroy
  has_many :custom_domains, dependent: :destroy
  has_many :api_keys, dependent: :destroy
  has_many :link_visits, dependent: :destroy
  has_one :account, dependent: :destroy
  has_one :public_profile, dependent: :destroy

  after_create :enable_trial
  after_create :send_welcome_email
  after_create :notify_slack
  
  def account
    Account.find_or_create_by(user: self)
  end

  def free_plan?
    subscription.nil? || subscription.cancelled?
  end

  def lifetime_deal_plan?
    subscription && subscription.processor_id == "coupon"
  end

  def subscription_plan
    Plan.find_by(paddle_plan_id: subscription.processor_plan)
  end

  def admin?
    id == 1 && email == "hello@ajvillalobos.com"
  end

  def username_or_email
    username || email
  end

  def export_links
    attributes = %w(destination_url redirect_url)

    CSV.generate(headers: true) do |csv|
      csv << attributes

      links.each do |link|
        csv << attributes.map { |attr| link.send(attr) }
      end
    end
  end

  def active_for_authentication?
    super && !deactivated
  end

  private

  def enable_trial
    update(trial_ends_at: 7.days.from_now)
  end

  def send_welcome_email
    UserMailer.with(user_id: self.id).welcome_email.deliver_later
  end

  def notify_slack
    notification = SignupNotification.with(user: self)
    notification.deliver_later(AdminUser.first)
  end
end
