require "test_helper"

class SquadTest < ActiveSupport::TestCase
  setup do
    @squad = squads(:jedi)
  end

  test "name should be present" do
    @squad.crews << Crew.first
    @squad.name = ""
    assert_not @squad.valid?
  end

  test "leader should be present" do
    # squad fixture has no crews assigned yet, but has leader assigned
    @squad.crews << Crew.first
    assert @squad.valid?
  end

  test "crew should be present" do
    # squad has no crew assigned
    assert_not @squad.valid?
  end

end
