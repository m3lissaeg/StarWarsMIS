require "test_helper"

class SquadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad = squads(:jedi)
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get mission_squads_url(@mission)
    assert_response :success
  end

  test "should get new" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get new_mission_squad_url(@mission)
    assert_response :success
  end

  test "should create squad" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Squad.count') do
      post mission_squads_url(@mission), params: { squad: { name: "Name of the Squad",
                                        leader_id: 1
                              } }
                           
    end

    assert_redirected_to mission_squad_url(@mission, Squad.last)
  end

  test "should show squad" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get mission_squad_url(@mission, @squad)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get edit_mission_squad_url(@mission, @squad)
    assert_response :success
  end

  test "should update squad" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    patch mission_squad_url(@mission, @squad), params: { squad: { name: "New fansy name",
                                              leader_id: "2"
                                            } }
    assert_redirected_to mission_squad_url(@mission, @squad)
  end

  test "should destroy squad" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Squad.count', -1) do
      delete mission_squad_url(@mission, @squad)
    end

    assert_redirected_to mission_squads_url(@mission)
  end
end
