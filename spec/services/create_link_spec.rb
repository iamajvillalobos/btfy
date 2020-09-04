require "rails_helper"

RSpec.describe CreateLink do
  it "creates a link" do
    user = create(:user)
    link = user.links.new(
      destination_url: "https://google.com",
      name: "",
      slug: "",
      custom_domain_id: nil
    )
    
    result = described_class.(link)
    
    expect(result.success?).to eq true
    expect(result[:link].destination_url).to eq "https://google.com"
  end
end