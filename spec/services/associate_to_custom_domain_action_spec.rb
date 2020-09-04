require "rails_helper"

RSpec.describe AssociateToCustomDomainAction do
  context "custom domain is link to user" do
    let(:custom_domain) {create(:custom_domain, name: "userdomain.com")}
    let(:user) { custom_domain.user }
    let(:link) { build(:link, custom_domain_id: custom_domain.id, user: user) }

    it "associates the custom domain to the link" do
      result = described_class.execute(link: link)
      expect(result.custom_domain).to eq custom_domain
    end
  end

  context "custom domain is not link to user" do
    let(:user_1) { create(:user) }
    let(:user_2) { create(:user) }
    let(:custom_domain) { create(:custom_domain, user: user_2)}
    let(:link) { build(:link, custom_domain_id: custom_domain.id, user: user_1) }

    it "stop and throw an error" do
      result = described_class.execute(link: link)
      expect(result.custom_domain).not_to eq custom_domain
      expect(result.message).to eq "The user_id doesn't have access to the custom domain"
    end
  end

  context "custom domain is empty" do
    let(:user_1) { create(:user) }
    let(:link) { build(:link, custom_domain_id: nil, user: user_1) }
    
    it "proceeds to the next step" do
      result = described_class.execute(link: link)
      expect(result.custom_domain).to eq nil
    end
  end
end