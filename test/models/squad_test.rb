require "test_helper"

class SquadTest < ActiveSupport::TestCase
  setup do
    @squad = squads(:jedi)
    # squad fixture has no crews assigned yet
  end

  test "name should be present" do
    @squad.name = ""
    assert_not @squad.valid?
  end

  test "leader should be present" do
    assert_not @squad.leader.nil?
  end

  test "mission should be present" do
    assert_not @squad.mission.nil?
  end

  test "squad should be valid without crews assigned" do
    assert @squad.valid?
  end

end
