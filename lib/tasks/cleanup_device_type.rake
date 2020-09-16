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
end
