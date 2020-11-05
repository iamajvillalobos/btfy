class UpdateCustomDomainStatusJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  ACM_STATUS = {
    "cert issued" => "success",
    "in progress" => "pending",
    "dns verified" => "pending",
    "waiting" => "pending",
    "failing" => "pending",
  }

  def perform
    domains = CustomDomain.pending

    domains.each do |domain|
      status = CheckDnsStatus.(domain)
      puts "status: #{status}"
      domain.update(status: ACM_STATUS[status])
    end
  end
end
