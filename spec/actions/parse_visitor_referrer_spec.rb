require "rails_helper"

module Actions
  RSpec.describe ParseVisitorReferrer do
    let(:request) do
      double(
        "request",
        referrer: "https://disq.us/url?url=https%3A%2F%2Fbtfy.io%2FMYNOW2020%3ABMWnjdfFSVmcLptg3DXFurtjBM8&cuid=1"
      )
    end

    it "returns a string of referrer" do
      result = described_class.execute(request: request)
      expect(result.referrer).to eq "disq.us"
    end

    context "fb.me" do
      let(:request) do
        double("request", referrer: "fb.me/123456")
      end
      it "returns a string of fb.me" do
        result = described_class.execute(request: request)
        expect(result.referrer).to eq "fb.me"
      end
    end
  end
end
