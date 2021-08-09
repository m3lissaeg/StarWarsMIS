require "application_system_test_case"

class ShipsTest < ApplicationSystemTestCase
  setup do
    @ship = ships(:falcon)
  end
  
  test "visiting the index" do
    visit ships_url
    assert_selector "h3", text: "Ships"
  end
  
  test "creating a Ship" do
    visit ships_url
    click_on "New Ship"
    
    fill_in "Features", with: @ship.features
    fill_in "Name", with: @ship.name
    click_on "Create Ship"
    
    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal @ship.name, Ship.last.name
    assert_equal @ship.features, Ship.last.features
    
    assert_text "Ship was successfully created"
    assert_text @ship.name
    assert_text @ship.features
    click_on "Back"
  end
  
  test "updating a Ship" do
    visit ships_url
    click_on "Edit", match: :first
    fill_in "Features", with: "New Features"
    fill_in "Name", with: "New Name"
    click_on "Update Ship"
    assert_equal "New Name", Ship.order('id ASC').first.name
    assert_equal "New Features", Ship.order('id ASC').first.features
    
    assert_text "Ship was successfully updated"
    click_on "Back"
  end
  
  test "destroying a Ship" do
    visit ships_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end
    
    assert_text "Ship was successfully destroyed"
  end
end
