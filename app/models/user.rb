class User < ApplicationRecord
  include Pay::Billable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  has_many :links, dependent: :destroy
  has_many :custom_domains, dependent: :destroy

  def user_plan
    UserPlan.find_by(paddle_plan_id: subscription.processor_plan)
  end
end
