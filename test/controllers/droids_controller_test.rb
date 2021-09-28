require "test_helper"

class DroidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @droid = droids(:C3PO)
  end
  
  test "should get index" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get droids_url
    assert_response :success
  end
  
  test "should get new" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get new_droid_url
    assert_response :success
  end
  
  test "should create droid" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
    
    assert_redirected_to droid_url(Droid.last)
  end
  
  
  test "should validate presence of name and model" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    @droid.name = ""
    @droid.model = ""
    assert_no_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
  end
  
  test "should show droid" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get droid_url(@droid)
    assert_response :success
  end
  
  test "should get edit" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    get edit_droid_url(@droid)
    assert_response :success
  end
  
  test "should update droid" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    patch droid_url(@droid), params: { droid: { features: "New features", model: "New model", name: "New name" }  }
    assert_redirected_to droid_url(@droid)
  end
  
  test "should destroy droid" do
    login_as(users(:rey), :scope => :user, :run_callbacks => false)
    assert_difference('Droid.count', -1) do
      delete droid_url(@droid)
    end
    
    assert_redirected_to droids_url
  end
end
