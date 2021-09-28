require "test_helper"

class ShipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ship = ships(:falcon)
  end
  
  test "should get index" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get ships_url
    assert_response :success
  end

  test "should get new" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get new_ship_url
    assert_response :success
  end

  test "should create ship" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Ship.count') do
      post ships_url, params: { ship: { features: @ship.features, name: @ship.name } }
    end

    assert_redirected_to ship_url(Ship.last)
  end

  test "should validate presence of name" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    @ship.name = ""
    assert_no_difference('Ship.count') do
      post ships_url, params: { ship: { features: @ship.features, name: @ship.name } }
    end
  end
    
  test "should show ship" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get ship_url(@ship)
    assert_response :success
  end

  test "should get edit" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get edit_ship_url(@ship)
    assert_response :success
  end

  test "should update ship" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    patch ship_url(@ship), params: { ship: { features: "New features", name: "New name" } }
    assert_redirected_to ship_url(@ship)
  end

  test "should destroy ship" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Ship.count', -1) do
      delete ship_url(@ship)
    end

    assert_redirected_to ships_url
  end
end
