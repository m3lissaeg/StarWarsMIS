require "test_helper"

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { coord: @location.coord, system: @location.system } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should validate presence of system and coord" do
    @location.system = ""
    @location.coord = ""
    assert_no_difference('Location.count') do
      post locations_url, params: { location: { coord: @location.coord, system: @location.system } }
    end
  end
  
  test "system should be present" do
    @location.system = ""
    assert_not @location.valid?
  end

  test "coord should be present" do
    @location.coord = ""
    assert_not @location.valid?
  end

  test "system should not be too long" do
    @location.system = "a" * 51
    assert_not @location.valid?
  end

  test "coord should not be too long" do
    @location.coord = "a" * 51
    assert_not @location.valid?
  end
  
  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { coord: @location.coord, system: @location.system } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
