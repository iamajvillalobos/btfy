# frozen_string_literal: true

require "rails_helper"

RSpec.describe DeleteCustomDomainRecord do
  let!(:domain) { create(:custom_domain) }

  it "deletes the custom domain record" do
    expect {
      described_class.execute(custom_domain: domain)
    }.to change { CustomDomain.count }.by(-1)
  end
end
