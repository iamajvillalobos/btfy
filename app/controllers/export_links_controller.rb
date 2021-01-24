class ExportLinksController < ApplicationController

  before_action :authenticate_user!
  skip_authorization_check

  def new
    respond_to do |format|
      filename = "#{current_user.email}-links-#{Date.today}.csv"
      format.csv { send_data current_user.export_links, filename: filename }
    end
  end
end