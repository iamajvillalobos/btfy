class SignupNotification < Noticed::Base
  deliver_by :slack, format: :format_for_slack, url: :url_for_slack
  param :user

  def format_for_slack
    {
      text: "#{params[:user].username} registered on btfy"
    }
  end

  def url_for_slack
    "https://hooks.slack.com/services/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"
  end
end
