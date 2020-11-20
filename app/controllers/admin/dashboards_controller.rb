class Admin::DashboardsController < ApplicationController
  layout "admin"

  before_action :authenticate_admin_user!
  skip_authorization_check

  def show
    @link_visits_yday = LinkVisit.where(created_at: Date.yesterday.in_time_zone("Asia/Singapore").all_day)
    @link_visits_today = LinkVisit.where(created_at: Date.today.in_time_zone("Asia/Singapore").all_day)
    @links_created_yday = Link.where(created_at: Date.yesterday.in_time_zone("Asia/Singapore").all_day)
    @links_created_today = Link.where(created_at: Date.today.in_time_zone("Asia/Singapore").all_day)
    @users_yday = User.where(created_at: Date.yesterday.in_time_zone("Asia/Singapore").all_day)
    @users_today = User.where(created_at: Date.today.in_time_zone("Asia/Singapore").all_day)
  end
end