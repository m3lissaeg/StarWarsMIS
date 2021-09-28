require "test_helper"

class MissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get missions_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get new_mission_url
    assert_response :success
  end

  test "should create mission" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
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
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get mission_url(@mission)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get edit_mission_url(@mission)
    assert_response :success
  end

  test "should update mission" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
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
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Mission.count', -1) do
      delete mission_url(@mission)
    end

    assert_redirected_to missions_url
  end
end
