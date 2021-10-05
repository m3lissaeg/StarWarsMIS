require "test_helper"

class MissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission = missions(:yavinfour)
  end

  test "should get index " do
    sign_in users(:rey)
    get missions_url
    assert_response :success
  end

  test "should not get index if user is not logged in" do
    get missions_url
    assert_redirected_to new_user_session_url
  end

  test "should get new if user is admin" do
    sign_in users(:rey)
    get new_mission_url
    assert_response :success
  end

  test "should not get new if user is not admin" do
    sign_in users(:luke)
    get new_mission_url
    assert_redirected_to error404_url
  end

  test "should not get new if user is not logged in" do
    get new_mission_url
    assert_redirected_to new_user_session_url
  end

  test "should create mission if user is admin" do
    sign_in users(:rey)
    assert_difference('Mission.count') do
      post missions_url, params: { mission: { commander_id: 2, 
                                            details: @mission.details, 
                                            end_date: @mission.end_date, 
                                            location_id: 2, 
                                            start_date: @mission.start_date, 
                                            status: @mission.status,
                                            squad_ids: ["1" , "2"] 
                                  } }
    end

    assert_redirected_to mission_url(Mission.last)
  end

  test "should not create mission if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Mission.count') do
      post missions_url, params: { mission: { commander_id: 2, 
                                            details: @mission.details, 
                                            end_date: @mission.end_date, 
                                            location_id: 2, 
                                            start_date: @mission.start_date, 
                                            status: @mission.status,
                                            squad_ids: ["1" , "2"] 
                                  } }
    end
  end

  test "should not create mission if user is not logged in" do
    assert_no_difference('Mission.count') do
      post missions_url, params: { mission: { commander_id: 2, 
                                            details: @mission.details, 
                                            end_date: @mission.end_date, 
                                            location_id: 2, 
                                            start_date: @mission.start_date, 
                                            status: @mission.status,
                                            squad_ids: ["1" , "2"] 
                                  } }
    end

    assert_redirected_to new_user_session_url
  end

  test "should show mission if user is admin" do
    sign_in users(:rey)
    get mission_url(@mission)
    assert_response :success
  end

  test "should not show mission if user is not admin and is not associated with mission" do
    sign_in users(:luke)
    get mission_url(@mission)
    assert_redirected_to error404_url
  end

  test "should not show mission if user is not logged in" do
    get mission_url(@mission)
    assert_redirected_to new_user_session_url
  end

  test "should get edit if user is admin" do
    sign_in users(:rey)
    get edit_mission_url(@mission)
    assert_response :success
  end

  test "should not get edit if user is not admin" do
    sign_in users(:luke)
    get edit_mission_url(@mission)
    assert_redirected_to error404_url
  end

  test "should not get edit if user is not logged in" do
    get edit_mission_url(@mission)
    assert_redirected_to new_user_session_url
  end

  test "should update mission if user is admin" do
    sign_in users(:rey)
    patch mission_url(@mission), params: { mission: { commander_id: @mission.commander_id, 
                                                    details: "New details for this mission", 
                                                    end_date: @mission.end_date, 
                                                    location_id: @mission.location_id, 
                                                    start_date: @mission.start_date, 
                                                    status: "in_progress",
                                                    squad_ids: ["1"] 
                                        } }
    assert_redirected_to mission_url(@mission)
  end

  test "should not update mission if user is not admin" do
    sign_in users(:luke)
    assert_no_changes @mission do
      patch mission_url(@mission), params: { mission: { commander_id: @mission.commander_id, 
                                                      details: "New details for this mission", 
                                                      end_date: @mission.end_date, 
                                                      location_id: @mission.location_id, 
                                                      start_date: @mission.start_date, 
                                                      status: "in_progress",
                                                      squad_ids: ["1"] 
                                          } }
    end
  end

  test "should not update mission if user is not logged in" do
    assert_no_changes @mission do
      patch mission_url(@mission), params: { mission: { commander_id: @mission.commander_id, 
                                                      details: "New details for this mission", 
                                                      end_date: @mission.end_date, 
                                                      location_id: @mission.location_id, 
                                                      start_date: @mission.start_date, 
                                                      status: "in_progress",
                                                      squad_ids: ["1"] 
                                          } }
    end
  end

  test "should destroy mission if user is admin" do
    sign_in users(:rey)
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission)
    end

    assert_redirected_to missions_url
  end

  test "should not destroy mission if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Mission.count') do
      delete mission_url(@mission)
    end
  end

  test "should not destroy mission if user is not logged in" do
    assert_no_difference('Mission.count') do
      delete mission_url(@mission)
    end
  end
end
