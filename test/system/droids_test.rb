require "application_system_test_case"

class DroidsTest < ApplicationSystemTestCase
  setup do
    @droid = droids(:C3PO)
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
    
    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal @droid.features, Droid.last.features
    assert_equal @droid.model, Droid.last.model
    assert_equal @droid.name, Droid.last.name
    
    assert_text "Droid was successfully created"
    assert_text @droid.features
    assert_text @droid.model
    assert_text @droid.name
    click_on "Back"
  end
  
  test "updating a Droid" do
    visit droids_url
    click_on "Edit", match: :first
    fill_in "Features", with: @droid.features
    fill_in "Model", with: @droid.model
    fill_in "Name", with: @droid.name
    click_on "Update Droid"

    assert_equal @droid.features, Droid.first.features
    assert_equal @droid.model, Droid.first.model
    assert_equal @droid.name, Droid.first.name
    
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
