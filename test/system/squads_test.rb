require "application_system_test_case"

class SquadsTest < ApplicationSystemTestCase
  setup do
    @squad = squads(:jedi)
  end

  test "visiting the index" do
    visit squads_url
    assert_selector "h3", text: "Squads"
  end

  test "creating a Squad" do
    visit squads_url
    click_on "New Squad"

    fill_in "Name", with: @squad.name
    page.select "Rey Skywalker", from: "squad_leader_id"
    page.select "Ghost team", from: "squad_crew_ids"
    
    click_on "Submit"
    assert_text "Squad was successfully created"
    click_on "Back"
  end

  test "updating a Squad" do
    visit squads_url
    click_on "Edit", match: :first

    fill_in "Name", with: "@squad.name"
    page.select "Luke Skywalker", from: "squad_leader_id"
    page.select "Red Five", from: "squad_crew_ids"
    click_on "Submit"

    assert_text "Squad was successfully updated"
    click_on "Back"
  end

  test "destroying a Squad" do
    visit squads_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Squad was successfully destroyed"
  end
end
