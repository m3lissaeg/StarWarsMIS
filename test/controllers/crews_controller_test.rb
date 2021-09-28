require "test_helper"

class CrewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @squad = squads(:jedi)
    @crew = crews(:red5)
    @mission = missions(:yavinfour)
  end

  test "should get index" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get mission_squad_crews_url(@mission, @squad)
    assert_response :success
  end

  test "should get new" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get new_mission_squad_crew_url(@mission, @squad)
    assert_response :success
  end

  test "should create crew" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Crew.count') do
      post mission_squad_crews_url(@mission, @squad), params: { crew: { name: @crew.name , 
                                      ship_id: "1",
                                      droid_ids: ["1"],
                                      rebel_ids: ["1"]
                                    } }
    end

    assert_redirected_to mission_squad_crew_url(@mission, @squad, Crew.last)
  end

  test "should show crew" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get mission_squad_crew_url(@mission, @squad, @crew)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get edit_mission_squad_crew_url(@mission, @squad, @crew)
    assert_response :success
  end

  test "should update crew" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    patch mission_squad_crew_url(@mission, @squad, @crew), params: { crew: { name: @crew.name , 
                                           ship_id: "2",
                                           droid_ids: ["2"],
                                           rebel_ids: ["2"]
                                         } }
    assert_redirected_to mission_squad_crew_url(@mission, @squad, @crew)
  end

  test "should destroy crew" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Crew.count', -1) do
      delete mission_squad_crew_url(@mission, @squad, @crew)
    end

    assert_redirected_to mission_squad_crews_url(@mission, @squad)
  end
end
