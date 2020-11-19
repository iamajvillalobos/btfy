require "rails_helper"

module Api
  module V1
    RSpec.describe LinksController, type: :controller do
      let(:user) { create(:user) }
      let(:api_key) { create(:api_key, user: user) }

      context "without custom domain" do
        it "creates a short link" do
          request.headers["Authorization"] = "Bearer #{api_key.key}"
          post :create, params: {
            "link": {
              "destination_url": "https://google.com"
            }
          }

          response_body = JSON.parse(response.body)["link"]
          
          expect(response.status).to eq 200
          expect(response_body["name"]).to eq "https://google.com"
          expect(response_body["no_tracking"]).to eq true
          expect(response_body["custom_domain_id"]).to eq nil
        end

        it "creates a short link with tracking" do
          request.headers["Authorization"] = "Bearer #{api_key.key}"
          post :create, params: {
            "link": {
              "destination_url": "https://google.com",
              "no_tracking": false
            }
          }

          response_body = JSON.parse(response.body)["link"]
          
          expect(response.status).to eq 200
          expect(response_body["no_tracking"]).to eq false

        end
      end

      context "with custom domain" do
        let(:custom_domain) { create(:custom_domain, user: user) }

        it "creates a short link" do
          request.headers["Authorization"] = "Bearer #{api_key.key}"
          post :create, params: {
            "link": {
              "destination_url": "https://google.com",
              "custom_domain_id": custom_domain.id,
            }
          }

          response_body = JSON.parse(response.body)["link"]
          
          expect(response.status).to eq 200
          expect(response_body["name"]).to eq "https://google.com"
          expect(response_body["no_tracking"]).to eq true
          expect(response_body["custom_domain_id"]).to eq custom_domain.id
        end
      end
    end
  end
end