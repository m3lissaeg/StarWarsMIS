require "test_helper"

class CrewTest < ActiveSupport::TestCase
  setup do
    @crew = crews(:red5)
  end

  test "name should be present" do
    @crew.name = ""
    assert_not @crew.valid?
  end

end
