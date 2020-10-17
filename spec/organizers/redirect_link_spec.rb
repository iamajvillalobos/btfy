# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RedirectLink, type: :organizer do
  let!(:user) { create(:user) }
  let!(:salt) { create(:salt) }

  context "btfy.io link" do
    it "ctx.url is destination_url" do
      link = create(:link, destination_url: "https://github.com/iamajvillalobos")
      ctx = described_class.call(link)
      expect(ctx.url).to eq link.destination_url
    end

    it "ctx.url is 404 url" do
      link = create(:link)
      ctx = described_class.call(link)
      expect(ctx.url).to eq "/404"
    end
  end

  context "user has custom domain" do
    let(:custom_domain) do
      create(:custom_domain, {
        name: "good.link",
        redirect_url: "http://redirect.link",
        not_found_url: "http://not-found.link",
        user: user
      })
    end

    let(:valid_link) do
      create(:link, {
        destination_url: "https://github.com/iamajvillalobos",
        custom_domain: custom_domain
      })
    end

    let(:invalid_link) { create(:link, custom_domain: custom_domain) }

    it "ctx.url is destination_url" do
      ctx = described_class.call(valid_link)
      expect(ctx.url).to eq valid_link.destination_url
    end

    it "ctx.url is 404 url" do
      ctx = described_class.call(invalid_link)
      expect(ctx.url).to eq invalid_link.custom_domain.not_found_url
    end
  end
end
