require "application_system_test_case"

class CrewsTest < ApplicationSystemTestCase
  setup do
    @crew = crews(:red5)
  end

  test "visiting the index" do
    visit crews_url
    assert_selector "h3", text: "Crews"
  end

  test "creating a Crew" do
    visit crews_url
    click_on "New Crew"

    fill_in "Name", with: @crew.name
    page.select "X-wing fighter", from: "crew_ship_ids"
    page.select "C-3PO", from: "crew_droid_ids"
    page.select "Rey Skywalker", from: "crew_rebel_ids"
    click_on "Submit"

    assert_text "Crew was successfully created"
    click_on "Back"
  end

  test "updating a Crew" do
    visit crews_url
    click_on "Edit", match: :first

    fill_in "Name", with: "New cool name B)"
    page.select "Millenium Falcon", from: "crew_ship_ids"
    page.select "R2-D2", from: "crew_droid_ids"
    page.select "Luke Skywalker", from: "crew_rebel_ids"
    click_on "Submit"

    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal "New cool name B)", Crew.order('id ASC').first.name
    # assert_equal "R2-D2", Crew.order('id ASC').first.droids

    assert_text "Crew was successfully updated"
    assert_text "New cool name B)"
    assert_text "Millenium Falcon"
    assert_text "R2-D2"
    assert_text "Luke Skywalker"
    
    click_on "Back"
  end

  test "destroying a Crew" do
    visit crews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Crew was successfully destroyed"
  end
end
