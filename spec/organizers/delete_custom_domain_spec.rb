# frozen_string_literal: true

require "rails_helper"

RSpec.describe DeleteCustomDomain do
  let(:ctx) {
    LightService::Context.new(
      custom_domain: domain
    )
  }
  let(:domain) { create(:custom_domain) }

  it "runs all the actions" do
    actions = [
      DeleteCustomDomainRecord,
      DeleteDnsEntry
    ]

    actions.each do |action|
      expect(action).to receive(:execute).with(ctx).ordered.and_return(ctx)
    end

    described_class.call(domain)
  end
end
