require "test_helper"

class CrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad = squads(:jedi)
    @crew = crews(:red5)
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    sign_in users(:rey)
    get mission_squad_crews_url(@mission, @squad)
    assert_response :success
  end

  test "should not get index if user is not logged in" do
    get mission_squad_crews_url(@mission, @squad)
    assert_redirected_to new_user_session_url
  end

  test "should get new" do
    sign_in users(:rey)
    get new_mission_squad_crew_url(@mission, @squad)
    assert_response :success
  end

  test "should not get new if user is not admin" do
    sign_in users(:luke)
    get new_mission_squad_crew_url(@mission, @squad)
    assert_redirected_to error404_url
  end

  test "should not get new if user is not logged in" do
    get new_mission_squad_crew_url(@mission, @squad)
    assert_redirected_to new_user_session_url
  end

  test "should create crew" do
    sign_in users(:rey)
    assert_difference('Crew.count') do
      post mission_squad_crews_url(@mission, @squad), params: { crew: { name: @crew.name , 
                                      ship_id: "1",
                                      droid_ids: ["1"],
                                      rebel_ids: ["1"]
                                    } }
    end

    assert_redirected_to mission_squad_crew_url(@mission, @squad, Crew.last)
  end

  test "should not create crew if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Crew.count') do
      post mission_squad_crews_url(@mission, @squad), params: { crew: { name: @crew.name , 
                                      ship_id: "1",
                                      droid_ids: ["1"],
                                      rebel_ids: ["1"]
                                    } }
    end
  end

  test "should not create crew if user is not logged in" do
    assert_no_difference('Crew.count') do
      post mission_squad_crews_url(@mission, @squad), params: { crew: { name: @crew.name , 
                                      ship_id: "1",
                                      droid_ids: ["1"],
                                      rebel_ids: ["1"]
                                    } }
    end
  end

  test "should show crew" do
    sign_in users(:rey)
    get mission_squad_crew_url(@mission, @squad, @crew)
    assert_response :success
  end

  # test "should not show crew if user is not admin" do
  #   sign_in users(:luke)
  #   get mission_squad_crew_url(@mission, @squad, @crew)
  #   assert_redirected_to error404_url
  # end

  test "should not show crew if user is not logged in" do
    get mission_squad_crew_url(@mission, @squad, @crew)
    assert_redirected_to new_user_session_url
  end

  test "should get edit" do
    sign_in users(:rey)
    get edit_mission_squad_crew_url(@mission, @squad, @crew)
    assert_response :success
  end

  test "should not get edit if user is not admin" do
    sign_in users(:luke)
    get edit_mission_squad_crew_url(@mission, @squad, @crew)
    assert_redirected_to error404_url
  end

  test "should not get edit if user is not logged in" do
    get edit_mission_squad_crew_url(@mission, @squad, @crew)
    assert_redirected_to new_user_session_url
  end

  test "should update crew" do
    sign_in users(:rey)
    patch mission_squad_crew_url(@mission, @squad, @crew), params: { crew: { name: @crew.name , 
                                           ship_id: "2",
                                           droid_ids: ["2"],
                                           rebel_ids: ["2"]
                                         } }
    assert_redirected_to mission_squad_crew_url(@mission, @squad, @crew)
  end

  test "should not update crew if user is not admin" do
    sign_in users(:luke)
    assert_no_changes @crew do
      patch mission_squad_crew_url(@mission, @squad, @crew), params: { crew: { name: @crew.name , 
                                             ship_id: "2",
                                             droid_ids: ["2"],
                                             rebel_ids: ["2"]
                                           } }
    end
  end

  test "should not update crew if user is not logged in" do
    assert_no_changes @crew do
      patch mission_squad_crew_url(@mission, @squad, @crew), params: { crew: { name: @crew.name , 
                                             ship_id: "2",
                                             droid_ids: ["2"],
                                             rebel_ids: ["2"]
                                           } }
    end
  end

  test "should destroy crew if user is admin" do
    sign_in users(:rey)
    assert_difference('Crew.count', -1) do
      delete mission_squad_crew_url(@mission, @squad, @crew)
    end

    assert_redirected_to mission_squad_crews_url(@mission, @squad)
  end

  test "should not destroy crew if user is not admin" do
    sign_in users(:luke)
    assert_no_difference('Crew.count') do
      delete mission_squad_crew_url(@mission, @squad, @crew)
    end
  end

  test "should not destroy crew if user is not logged in" do
    assert_no_difference('Crew.count') do
      delete mission_squad_crew_url(@mission, @squad, @crew)
    end
  end
end
