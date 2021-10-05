require "application_system_test_case"

class MissionsTest < ApplicationSystemTestCase
  setup do
    @squad = squads(:jedi)
    @mission = missions(:yavinfour)
  end

  test "visiting the index" do
    sign_in users(:rey)
    visit missions_url
    assert_selector "h3", text: "Missions"
  end

  test "admin user visiting index" do
    sign_in users(:rey)
    visit missions_url
    assert_selector "td", {count: missions.count, text: "Show"}
  end

  test "not admin user visiting index" do
    sign_in users(:luke)
    visit missions_url
    assert_no_selector "a", text: "New Mission"
    assert_selector "td", {count: users(:luke).missions.count, text: "Show"}
  end

  test "creating a Mission" do
    sign_in users(:rey)
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

    page.select "Planning", from: "mission_status"
    click_on "Submit"

    assert_text "Mission was successfully created"
    assert_text @mission.commander.id
    assert_text @mission.location.id
    assert_text "2021-09-08"
    click_on "Back"
  end

  test "updating a Mission" do
    sign_in users(:rey)
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

    page.select "Success", from: "mission_status"
    click_on "Submit"

    assert_text "Mission was successfully updated"
    assert_equal "success", Mission.order('id ASC').first.status

    click_on "Back"
  end

  test "Adding a Squad to a Mission" do
    sign_in users(:rey)
    visit missions_url
    click_on "Show", match: :first
    click_on "Add Squad"
    
    fill_in "Name", with: @squad.name
    page.select "Rey Skywalker", from: "squad_leader_id"
    
    click_on "Submit"
    assert_text "Squad was successfully created"
    click_on "Back"
  end

  test "destroying a Mission" do
    sign_in users(:rey)
    visit missions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mission was successfully destroyed"
  end
end
