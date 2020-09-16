namespace :cleanup_device_type do
  task run: :environment do
    LinkVisit.all.each do |visit|
      next if visit.device_type.nil?

      device_type = case visit.device_type
      when "desktop"
        "Desktop"
      when "phablet"
        "Tablet"
      when "smartphone"
        "Mobile"
      else
        visit.device_type
      end

      visit.update(device_type: device_type)
    end
  end

  task remove_bots: :environment do
    bot_visits = LinkVisit.where(browser: nil, device_type: nil)
    bot_visits.destroy_all
  end
end
