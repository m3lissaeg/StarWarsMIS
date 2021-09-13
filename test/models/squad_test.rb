require "test_helper"

class SquadTest < ActiveSupport::TestCase
  setup do
    @squad = squads(:jedi)
    crew = crews(:red5)
    # squad fixture has no crews assigned yet
    @squad.crews << crew
  end

  test "name should be present" do
    @squad.name = ""
    assert_not @squad.valid?
  end

  test "leader should be present" do
    assert_not @squad.leader.nil?
  end

  test "crew should be present" do
    assert_not @squad.crews.nil?
  end

end
