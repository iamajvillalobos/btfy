class PeriodDropdownComponent < ViewComponent::Base
  def initialize(path:, default_text:)
    @path = path
    @default_text = default_text
  end

  def button_name
    case params[:period]
    when "day"
      "Today"
    when "7d"
      "Last 7 days"
    when "30d"
      "Last 30 days"
    when "60d"
      "Last 60 days"
    else
      @default_text
    end
  end
end
