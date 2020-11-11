class PeriodDropdownComponent < ViewComponent::Base
  def initialize(path:, default_text:)
    @path = path
    @default_text = default_text
  end

  def button_name
    case params[:period]
    when "7d"
      "Last 7 days"
    when "30d"
      "Last 30 days"
    else
      @default_text
    end
  end
end
