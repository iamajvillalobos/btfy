class User < ApplicationRecord
  include Pay::Billable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :links, dependent: :destroy
  has_many :custom_domains, dependent: :destroy
  has_one :account, dependent: :destroy

  def account
    Account.find_or_create_by(user: self)
  end

  def user_plan
    return nil unless subscribed?
    UserPlan.find_by(paddle_plan_id: subscription.processor_plan)
  end

  def free_plan?
    subscription.nil?
  end
end
