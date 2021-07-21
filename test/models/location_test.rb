require "test_helper"

class LocationTest < ActiveSupport::TestCase
  setup do
    @location = locations(:deathstar)
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
  
end
