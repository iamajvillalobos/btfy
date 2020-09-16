require "rails_helper"

RSpec.describe InitializeVisitorDevice do
  context "user agent is a bot / invalid" do
    let(:request) { double("dummy request", user_agent: "klajhsdlkjh") }

    it "fails the context" do
      result = described_class.execute(request: request)
      expect(result.failure?).to eq true
    end
  end

  context "user agent is valid" do
    let(:request) { double("dummy request", user_agent: "Mozilla/5.0 (Macintosh; Intel Mac OS X x.y; rv:42.0) Gecko/20100101 Firefox/42.0") }

    it "returns a device context" do
      result = described_class.execute(request: request)
      expect(result.failure?).to eq false
      expect(result.device).not_to be_nil
      expect(result.device.name).to eq "Firefox"
    end
  end
end
