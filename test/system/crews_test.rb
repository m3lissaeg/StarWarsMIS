require "application_system_test_case"

class CrewsTest < ApplicationSystemTestCase
  setup do
    @crew = crews(:one)
  end

  test "visiting the index" do
    visit crews_url
    assert_selector "h3", text: "Crews"
  end

  test "creating a Crew" do
    visit crews_url
    click_on "New Crew"

    fill_in "Name", with: @crew.name
    click_on "Submit"

    assert_text "Crew was successfully created"
    click_on "Back"
  end

  test "updating a Crew" do
    visit crews_url
    click_on "Edit", match: :first

    fill_in "Name", with: @crew.name
    click_on "Submit"

    assert_text "Crew was successfully updated"
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
