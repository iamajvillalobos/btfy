class UpdateCustomDomainStatusJob < ApplicationJob
  queue_as :default

  ACM_STATUS = {
    "cert issued" => "success",
    "in progress" => "pending",
    "dns verified" => "pending",
    "waiting" => "pending",
    "failing" => "pending"
  }

  def perform
    domains = CustomDomain.pending

    domains.each do |domain|
      status = CheckDnsStatus.call(domain)
      domain.update(status: ACM_STATUS[status])

      if status == "cert issued"
        CustomDomainMailer.with(user_id: domain.user.id, domain_id: domain.id)
          .domain_ready_email
          .deliver_later
      end
    end
  end
end
