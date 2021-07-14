require "test_helper"

class DroidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @droid = droids(:one)
  end
  
  test "should get index" do
    get droids_url
    assert_response :success
  end
  
  test "should get new" do
    get new_droid_url
    assert_response :success
  end
  
  test "should create droid" do
    assert_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
    
    assert_redirected_to droid_url(Droid.last)
  end
  
  
  test "should validate presence of name and model" do
    @droid.name = ""
    @droid.model = ""
    assert_no_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
  end
  
  test "name should be present" do
    @droid.name = ""
    assert_not @droid.valid?
  end
  
  test "model should be present" do
    @droid.model = ""
    assert_not @droid.valid?
  end

  test "name should not be too long" do
    @droid.name = "a" * 51
    assert_not @droid.valid?
  end

  test "model should not be too long" do
    @droid.model = "a" * 51
    assert_not @droid.valid?
  end
  
  test "should show droid" do
    get droid_url(@droid)
    assert_response :success
  end
  
  test "should get edit" do
    get edit_droid_url(@droid)
    assert_response :success
  end
  
  test "should update droid" do
    patch droid_url(@droid), params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    assert_redirected_to droid_url(@droid)
  end
  
  test "should destroy droid" do
    assert_difference('Droid.count', -1) do
      delete droid_url(@droid)
    end
    
    assert_redirected_to droids_url
  end
end
