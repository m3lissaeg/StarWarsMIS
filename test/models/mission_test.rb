require "test_helper"

class MissionTest < ActiveSupport::TestCase
  setup do
    @mission = missions(:yavinfour)
  end

  test "start_date should be present" do
    @mission.start_date = ""
    assert_not @mission.valid?
  end

  test "end_date should be present" do
    @mission.end_date = ""
    assert_not @mission.valid?
  end

  test "status should be present" do
    @mission.status = ""
    assert_not @mission.valid?
  end

  test "commander_id should be present" do
    @mission.commander_id = ""
    assert_not @mission.valid?
  end

  test "location_id should be present" do
    @mission.location_id = ""
    assert_not @mission.valid?
  end
end
