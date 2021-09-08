require "application_system_test_case"

class MissionsTest < ApplicationSystemTestCase
  setup do
    @mission = missions(:yavinfour)
  end

  test "visiting the index" do
    visit missions_url
    assert_selector "h3", text: "Missions"
  end

  test "creating a Mission" do
    visit missions_url
    click_on "New Mission"

    page.select "Rey Skywalker", from: "mission_commander_id"
    page.select "Death Star", from: "mission_location_id"
    fill_in "Details", with: @mission.details
    
    page.select "2021", from: "mission_start_date_1i"
    page.select "September", from: "mission_start_date_2i"
    page.select "8", from: "mission_start_date_3i"
    
    page.select "2022", from: "mission_end_date_1i"
    page.select "September", from: "mission_end_date_2i"
    page.select "8", from: "mission_end_date_3i"

    page.select "planning", from: "mission_status"
    click_on "Submit"

    assert_text "Mission was successfully created"
    assert_text @mission.commander.id
    assert_text @mission.location.id
    assert_text "2021-09-08"
    click_on "Back"
  end

  test "updating a Mission" do
    visit missions_url
    click_on "Edit", match: :first

    page.select "Luke Skywalker", from: "mission_commander_id"
    page.select "Death Star", from: "mission_location_id"
    fill_in "Details", with: @mission.details
    
    page.select "2016", from: "mission_start_date_1i"
    page.select "August", from: "mission_start_date_2i"
    page.select "8", from: "mission_start_date_3i"
    
    page.select "2021", from: "mission_end_date_1i"
    page.select "November", from: "mission_end_date_2i"
    page.select "8", from: "mission_end_date_3i"

    page.select "success", from: "mission_status"
    click_on "Submit"

    assert_text "Mission was successfully updated"
    assert_equal "success", Mission.order('id ASC').first.status

    click_on "Back"
  end

  test "destroying a Mission" do
    visit missions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mission was successfully destroyed"
  end
end
