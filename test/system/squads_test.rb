require "application_system_test_case"

class SquadsTest < ApplicationSystemTestCase
  setup do
    @squad = squads(:jedi)
    @crew = crews(:red5)
    @mission = missions(:yavinfour)
  end

  test "visiting the index" do
    visit mission_squads_url(@mission)
    assert_selector "h3", text: "Squads for Mission 1"
  end

  test "creating a Squad" do
    visit mission_squads_url(@mission)
    click_on "New Squad"

    fill_in "Name", with: @squad.name
    page.select "Rey Skywalker", from: "squad_leader_id"
    
    click_on "Submit"
    assert_text "Squad was successfully created"
    click_on "Back"
  end

  test "updating a Squad" do
    visit mission_squads_url(@mission)
    click_on "Edit", match: :first

    fill_in "Name", with: "@squad.name"
    page.select "Luke Skywalker", from: "squad_leader_id"
    click_on "Submit"

    assert_text "Squad was successfully updated"
    click_on "Back"
  end

  test "adding a Crew to a Squad" do
    visit mission_squads_url(@mission)
    click_on "Show", match: :first
    click_on "Add Crew"

    fill_in "Name", with: @crew.name
    page.select "X-wing fighter", from: "crew_ship_id"
    page.select "C-3PO", from: "crew_droid_ids"
    page.select "Rey Skywalker", from: "crew_rebel_ids"
    click_on "Submit"

    assert_text "Crew was successfully created"
    click_on "Back"
  end


  test "destroying a Squad" do
    visit mission_squads_url(@mission)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Squad was successfully destroyed"
  end
end
