require "test_helper"

class DroidTest < ActiveSupport::TestCase
  setup do
    @droid = droids(:C3PO)
  end
  
  test "name should be present" do
    @droid.name = ""
    assert_not @droid.valid?
  end
  
  test "model should be present" do
    @droid.model = ""
    assert_not @droid.valid?
  end

  test "name should not be too long" do
    @droid.name = "a" * 51
    assert_not @droid.valid?
  end

  test "model should not be too long" do
    @droid.model = "a" * 51
    assert_not @droid.valid?
  end
  
end
