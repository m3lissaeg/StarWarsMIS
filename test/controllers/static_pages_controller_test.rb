require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get error404" do
    get error404_url
    assert_redirected_to new_user_session_url
  end
end
