require "rails_helper"

RSpec.describe "create a link" do
  let!(:user) { create(:user) }

  before(:each) do
    sign_in user
  end

  context "free user" do
    it "can create a link" do
      user_url = Faker::Internet.url
      visit links_path
      click_on "Create Link"

      fill_in "Paste long URL", with: user_url
      fill_in "Slug", with: "customslugcreated"
      click_on "Create Link"

      expect(page).to have_selector(".alert", text: "Link was successfully created")
      expect(page).to have_content(user_url)
      expect(page).to have_link("customslugcreated")
    end

    it "cannot create a link after 5 links created" do
      5.times do
        create(:link, user: user)
      end

      visit links_path
      click_on "Create Link"

      expect(page).to have_selector(".alert", text: "You already reach the max amount of links.")
    end
  end
end
