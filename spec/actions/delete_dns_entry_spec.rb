# frozen_string_literal: true

require "rails_helper"

RSpec.describe DeleteDnsEntry, vcr: {record: :once} do
  let(:user) { create(:user) }
  let(:heroku) { PlatformAPI.connect_oauth(ENV["HEROKU_TOKEN"]) }

  context "connected domain" do
    let(:domain) { create(:custom_domain, {name: "ajvillalobos.com", user: user}) }

    it "deletes the domain dns entry" do
      response = heroku.domain.info(ENV["HEROKU_APP_NAME"], domain.name)
      expect(response["hostname"]).to eq "ajvillalobos.com"

      described_class.execute(custom_domain: domain)

      expect {
        heroku.domain.info(ENV["HEROKU_APP_NAME"], domain.name)
      }.to raise_error(Excon::Error::NotFound)
    end
  end
end
