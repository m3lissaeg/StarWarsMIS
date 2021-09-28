require "test_helper"

class MissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    sign_in users(:rey)
    get missions_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:rey)
    get new_mission_url
    assert_response :success
  end

  test "should create mission" do
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

  test "should show mission" do
    sign_in users(:rey)
    get mission_url(@mission)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:rey)
    get edit_mission_url(@mission)
    assert_response :success
  end

  test "should update mission" do
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

  test "should destroy mission" do
    sign_in users(:rey)
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission)
    end

    assert_redirected_to missions_url
  end
end
