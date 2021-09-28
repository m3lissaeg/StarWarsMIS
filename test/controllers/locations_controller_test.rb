require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:deathstar)
  end
  
  test "should get index" do
    sign_in users(:rey)
    get locations_url
    assert_response :success
  end
  
  test "should get new" do
    sign_in users(:rey)
    get new_location_url
    assert_response :success
  end
  
  test "should create location" do
    sign_in users(:rey)
    assert_difference('Location.count') do
      post locations_url, params: { location: { coord: "@location.coord", system: @location.system } }
    end
    
    assert_redirected_to location_url(Location.last)
  end
  
  test "should validate presence of system and coord" do
    sign_in users(:rey)
    @location.system = ""
    @location.coord = ""
    assert_no_difference('Location.count') do
      post locations_url, params: { location: { coord: @location.coord, system: @location.system } }
    end
  end
  
  test "should show location" do
    sign_in users(:rey)
    get location_url(@location)
    assert_response :success
  end
  
  test "should get edit" do
    sign_in users(:rey)
    get edit_location_url(@location)
    assert_response :success
  end
  
  test "should update location" do
    sign_in users(:rey)
    patch location_url(@location), params: { location: { coord: "New coord", system: "New system" } }
    assert_redirected_to location_url(@location)
  end
  
  test "should destroy location" do
    sign_in users(:rey)
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end
    
    assert_redirected_to locations_url
  end
end
