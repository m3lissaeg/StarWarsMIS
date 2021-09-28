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

  test "should get new" do
    sign_in users(:rey)
    get new_mission_squad_url(@mission)
    assert_response :success
  end

  test "should create squad" do
    sign_in users(:rey)
    assert_difference('Squad.count') do
      post mission_squads_url(@mission), params: { squad: { name: "Name of the Squad",
                                        leader_id: 1
                              } }
                           
    end

    assert_redirected_to mission_squad_url(@mission, Squad.last)
  end

  test "should show squad" do
    sign_in users(:rey)
    get mission_squad_url(@mission, @squad)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:rey)
    get edit_mission_squad_url(@mission, @squad)
    assert_response :success
  end

  test "should update squad" do
    sign_in users(:rey)
    patch mission_squad_url(@mission, @squad), params: { squad: { name: "New fansy name",
                                              leader_id: "2"
                                            } }
    assert_redirected_to mission_squad_url(@mission, @squad)
  end

  test "should destroy squad" do
    sign_in users(:rey)
    assert_difference('Squad.count', -1) do
      delete mission_squad_url(@mission, @squad)
    end

    assert_redirected_to mission_squads_url(@mission)
  end
end
