require "test_helper"

class ShipTest < ActiveSupport::TestCase
  setup do
    @ship = ships(:falcon)
  end
  
  test "name should be present" do
    @ship.name = ""
    assert_not @ship.valid?
  end
  
  test "name should not be too long" do
    @ship.name = "a" * 51
    assert_not @ship.valid?
  end
end
