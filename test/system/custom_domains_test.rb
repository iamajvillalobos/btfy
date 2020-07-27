require "application_system_test_case"

class CustomDomainsTest < ApplicationSystemTestCase
  setup do
    @custom_domain = custom_domains(:one)
  end

  test "visiting the index" do
    visit custom_domains_url
    assert_selector "h1", text: "Custom Domains"
  end

  test "creating a Custom domain" do
    visit custom_domains_url
    click_on "New Custom Domain"

    fill_in "Name", with: @custom_domain.name
    fill_in "Redirect url", with: @custom_domain.redirect_url
    click_on "Create Custom domain"

    assert_text "Custom domain was successfully created"
    click_on "Back"
  end

  test "updating a Custom domain" do
    visit custom_domains_url
    click_on "Edit", match: :first

    fill_in "Name", with: @custom_domain.name
    fill_in "Redirect url", with: @custom_domain.redirect_url
    click_on "Update Custom domain"

    assert_text "Custom domain was successfully updated"
    click_on "Back"
  end

  test "destroying a Custom domain" do
    visit custom_domains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Custom domain was successfully destroyed"
  end
end
