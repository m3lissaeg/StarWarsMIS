require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:deathstar)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h3", text: "Locations"
  end

  test "creating a Location" do
    visit locations_url
    click_on "New Location"

    fill_in "Coord", with: @location.coord
    fill_in "System", with: @location.system
    click_on "Create Location"
    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal @location.system, Location.last.system
    assert_equal @location.coord, Location.last.coord

    assert_text "Location was successfully created"
    assert_text @location.system
    assert_text @location.coord
    click_on "Back"

  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first
    fill_in "Coord", with: "New coord"
    fill_in "System", with: "New system"
    click_on "Update Location"

    assert_equal "New system", Location.order('id ASC').first.system
    assert_equal "New coord", Location.order('id ASC').first.coord

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
