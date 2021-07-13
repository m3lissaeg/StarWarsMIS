require "application_system_test_case"

class DroidsTest < ApplicationSystemTestCase
  setup do
    @droid = droids(:one)
  end

  test "visiting the index" do
    visit droids_url
    assert_selector "h1", text: "Droids"
  end

  test "creating a Droid" do
    visit droids_url
    click_on "New Droid"

    fill_in "Features", with: @droid.features
    fill_in "Model", with: @droid.model
    fill_in "Name", with: @droid.name
    click_on "Create Droid"

    assert_text "Droid was successfully created"
    click_on "Back"
  end

  test "updating a Droid" do
    visit droids_url
    click_on "Edit", match: :first

    fill_in "Features", with: @droid.features
    fill_in "Model", with: @droid.model
    fill_in "Name", with: @droid.name
    click_on "Update Droid"

    assert_text "Droid was successfully updated"
    click_on "Back"
  end

  test "destroying a Droid" do
    visit droids_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Droid was successfully destroyed"
  end
end
