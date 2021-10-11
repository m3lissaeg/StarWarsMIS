require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:rey)
  end

  test "should not get index if not logged in" do
    get users_url
    assert_redirected_to new_user_session_url
  end
  
  test "should get index if logged in as admin" do
    sign_in users(:rey)
    get users_url
    assert_response :success
  end

  test "should not get index if not logged in as admin" do
    sign_in users(:luke)
    get users_url
    assert_redirected_to error404_url
  end

  test "should get edit if user is admin" do
    sign_in users(:rey)
    get edit_user_url(@user)
    assert_response :success
  end

  test "should not get edit if user is not admin" do
    sign_in users(:luke)
    get edit_user_url(@user)
    assert_redirected_to error404_url
  end

  test "should not get edit if user is not logged in" do
    get edit_user_url(@user)
    assert_redirected_to new_user_session_url
  end

  test "should update user if user is admin" do
    sign_in users(:rey)
    patch user_url(@user), params: { user: { name: @user.name,
                                           email: @user.email,
                                           phone: @user.phone,
                                           rank: @user.rank,
                                           jedi: @user.jedi,
                                           admin: @user.admin             
                                        } }
    assert_redirected_to user_url(@user)
  end

  test "should not update user if user is not admin" do
    sign_in users(:luke)
    assert_no_changes @user do
      patch user_url(@user), params: { user: { name: "@user.name",
                                             email: "@user.email",
                                             phone: "@user.phone",
                                             rank: "@user.rank",
                                             jedi: false,
                                             admin: false
                                          } }
    end
  end

  test "should not update user if user is not logged in" do
    assert_no_changes @user do
      patch user_url(@user), params: { user: { name: "@user.name",
                                              email: "@user.email",
                                              phone: "@user.phone",
                                              rank: "@user.rank",
                                              jedi: false,
                                              admin: false
                                           } }
    end
  end

end
