require "rails_helper"

RSpec.describe LinkFinder do
  let(:user) { create(:user) }
  let(:ahoy) { Ahoy::Tracker.new(request: OpenStruct.new(remote_ip: "1.1.1.1")) }

  context "without a custom domain" do
    let!(:link1) { create(:link, slug: "abc123", user: user) }
    let(:request) { double(domain: "lvh.me", subdomain: "") }

    context "link exist" do
      let(:slug) { "abc123" }

      it "returns the link" do
        link = described_class.call(request, slug, ahoy).link
        expect(link).to eq link1
      end
    end

    context "link doesn't exist" do
      let(:slug) { "doesntexit" }

      it "returns nil" do
        link = described_class.call(request, slug, ahoy).link
        expect(link).to eq nil
      end
    end
  end


  context "with custom domain" do
    let(:custom_domain) { create(:custom_domain, user: user) }
    let!(:link1) {
      create(:link, slug: "abc123", user: user, custom_domain: custom_domain)
    }
    let(:request) { double(domain: "custom.domain", subdomain: "") }

    context "link exist" do
      let(:slug) { "abc123" }

      it "returns the link" do
        link = described_class.call(request, slug, ahoy).link
        expect(link).to eq link1
      end
    end
  end

  context "with custom subdomain" do
    let(:custom_domain) { create(:custom_domain, name: "link.custom.domain", user: user) }
    let!(:link1) {
      create(:link, slug: "abc123", user: user, custom_domain: custom_domain)
    }
    let(:request) { double(domain: "custom.domain", subdomain: "link") }

    context "link exist" do
      let(:slug) { "abc123" }

      it "returns the link" do
        link = described_class.call(request, slug, ahoy).link
        expect(link).to eq link1
      end
    end
  end
end
