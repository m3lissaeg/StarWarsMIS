require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:rey)
  end
  
  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "phone should be present" do
    @user.phone = ""
    assert_not @user.valid?
  end
  
  test "phone should not be too long" do
    @user.phone = "a" * 101
    assert_not @user.valid?
  end

end
