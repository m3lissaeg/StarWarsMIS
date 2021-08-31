require "test_helper"

class CrewTest < ActiveSupport::TestCase
  setup do
    @crew = crews(:red5)
    @crew.droids << Droid.first
    @crew.ships << Ship.first
    @crew.rebels << User.first
  end

  test "name should be present" do
    @crew.name = ""
    assert_not @crew.valid?
  end

  test "droid should be present" do
    @crew.droids.delete(1) 
    assert_not @crew.valid?
  end

  test "ship should be present" do
    @crew.ships.delete(1) 
    assert_not @crew.valid?
  end

  test "rebel should be present" do
    @crew.rebels.delete(1) 
    assert_not @crew.valid?
  end

end
