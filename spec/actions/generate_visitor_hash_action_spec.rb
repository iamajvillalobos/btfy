# frozen_string_literal: true

require "rails_helper"

RSpec.describe GenerateVisitorHashAction, type: :action do
  let!(:salt) { create(:salt) }
  let(:user_agent) do
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Safari/537.36"
  end
  let(:ctx) do
    {
      request: OpenStruct.new(
        referrer: "https://twitter.com",
        ip: "1.1.1.1",
        env: {
          "HTTP_USER_AGENT" => user_agent
        }
      )
    }
  end

  context "when executed" do
    it "is expected to be successful" do
      result = described_class.execute(ctx)
      expect(result).to be_a_success
      expect(result.visitor_hash).to eq "f5cdf8952f9f0783b6246ed582d97d44eae1b8a8551644a4e0380058d357ed0c"
    end
  end
end
