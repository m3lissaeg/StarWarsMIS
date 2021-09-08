require "application_system_test_case"

class MissionsTest < ApplicationSystemTestCase
  setup do
    @mission = missions(:yavinfour)
  end

  test "visiting the index" do
    visit missions_url
    assert_selector "h1", text: "Missions"
  end

  # test "creating a Mission" do
  #   visit missions_url
  #   click_on "New Mission"

  #   fill_in "Commander", with: @mission.commander_id
  #   fill_in "Details", with: @mission.details
  #   fill_in "End date", with: @mission.end_date
  #   fill_in "Location", with: @mission.location_id
  #   fill_in "Start date", with: @mission.start_date
  #   fill_in "Status", with: @mission.status
  #   click_on "Create Mission"

  #   assert_text "Mission was successfully created"
  #   click_on "Back"
  # end

  # test "updating a Mission" do
  #   visit missions_url
  #   click_on "Edit", match: :first

  #   fill_in "Commander", with: @mission.commander_id
  #   fill_in "Details", with: @mission.details
  #   fill_in "End date", with: @mission.end_date
  #   fill_in "Location", with: @mission.location_id
  #   fill_in "Start date", with: @mission.start_date
  #   fill_in "Status", with: @mission.status
  #   click_on "Update Mission"

  #   assert_text "Mission was successfully updated"
  #   click_on "Back"
  # end

  # test "destroying a Mission" do
  #   visit missions_url
  #   page.accept_confirm do
  #     click_on "Destroy", match: :first
  #   end

    # assert_text "Mission was successfully destroyed"
  # end
end
