require "test_helper"

class SquadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad = squads(:jedi)
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    sign_in users(:rey)
    get mission_squads_url(@mission)
    assert_response :success
  end

  test "should not get index if user is not logged in" do
    get mission_squads_url(@mission)
    assert_redirected_to new_user_session_url
  end

  test "should get new if user is admin" do
    sign_in users(:rey)
    get new_mission_squad_url(@mission)
    assert_response :success
  end

  test "should not get new if user is not admin" do
    sign_in users(:luke)
    get new_mission_squad_url(@mission)
    assert_redirected_to error404_url
  end

  test "should not get new if user is not logged in" do
    get new_mission_squad_url(@mission)
    assert_redirected_to new_user_session_url
  end

  test "should create squad if user is admin" do
    sign_in users(:rey)
    assert_difference('Squad.count') do
      post mission_squads_url(@mission), params: { squad: { name: "Name of the Squad",
                                        leader_id: 1
                              } }
                           
    end

    assert_redirected_to mission_squad_url(@mission, Squad.last)
  end

  test "should not create squad if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Squad.count') do
      post mission_squads_url(@mission), params: { squad: { name: "Name of the Squad",
                                        leader_id: 1
                              } }
                           
    end
  end

  test "should not create squad if user is not logged in" do
    assert_no_difference('Squad.count') do
      post mission_squads_url(@mission), params: { squad: { name: "Name of the Squad",
                                        leader_id: 1
                              } }
                           
    end
  end

  test "should show squad if user is admin" do
    sign_in users(:rey)
    get mission_squad_url(@mission, @squad)
    assert_response :success
  end

  # test "should not show squad if user is not admin and squad is not associated with mission" do
  #   sign_in users(:luke)
  #   get mission_squad_url(@mission, @squad)
  #   assert_redirected_to error404_url
  # end

  test "should not show squad if user is not logged in" do
    get mission_squad_url(@mission, @squad)
    assert_redirected_to new_user_session_url
  end

  test "should get edit if user is admin" do
    sign_in users(:rey)
    get edit_mission_squad_url(@mission, @squad)
    assert_response :success
  end

  test "should not get edit if user is not admin" do
    sign_in users(:luke)
    get edit_mission_squad_url(@mission, @squad)
    assert_redirected_to error404_url
  end

  test "should not get edit if user is not logged in" do
    get edit_mission_squad_url(@mission, @squad)
    assert_redirected_to new_user_session_url
  end

  test "should update squad if user is admin" do
    sign_in users(:rey)
    patch mission_squad_url(@mission, @squad), params: { squad: { name: "New fansy name",
                                              leader_id: "2"
                                            } }
    assert_redirected_to mission_squad_url(@mission, @squad)
  end

  test "should not update squad if user is not admin" do
    sign_in users(:luke)
    assert_no_changes @squad do
      patch mission_squad_url(@mission, @squad), params: { squad: { name: "New fansy name",
                                                leader_id: "2"
                                              } }
    end                                            
  end

  test "should not update squad if user is not logged in" do
    assert_no_changes @squad do
      patch mission_squad_url(@mission, @squad), params: { squad: { name: "New fansy name",
                                                leader_id: "2"
                                              } }
    end                                            
  end

  test "should destroy squad if user is admin" do
    sign_in users(:rey)
    assert_difference('Squad.count', -1) do
      delete mission_squad_url(@mission, @squad)
    end

    assert_redirected_to mission_squads_url(@mission)
  end

  test "should not destroy squad if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Squad.count') do
      delete mission_squad_url(@mission, @squad)
    end
  end

  test "should not destroy squad if user is not logged in" do
    assert_no_difference('Squad.count') do
      delete mission_squad_url(@mission, @squad)
    end
  end
end
