require "test_helper"

class DroidsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @droid = droids(:C3PO)
  end
  
  test "should get index" do
    sign_in users(:rey)
    get droids_url
    assert_response :success
  end
  
  test "should get new" do
    sign_in users(:rey)
    get new_droid_url
    assert_response :success
  end
  
  test "should create droid" do
    sign_in users(:rey)
    assert_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
    
    assert_redirected_to droid_url(Droid.last)
  end
  
  
  test "should validate presence of name and model" do
    sign_in users(:rey)
    @droid.name = ""
    @droid.model = ""
    assert_no_difference('Droid.count') do
      post droids_url, params: { droid: { features: @droid.features, model: @droid.model, name: @droid.name } }
    end
  end
  
  test "should show droid" do
    sign_in users(:rey)
    get droid_url(@droid)
    assert_response :success
  end
  
  test "should get edit" do
    sign_in users(:rey)
    get edit_droid_url(@droid)
    assert_response :success
  end
  
  test "should update droid" do
    sign_in users(:rey)
    patch droid_url(@droid), params: { droid: { features: "New features", model: "New model", name: "New name" }  }
    assert_redirected_to droid_url(@droid)
  end
  
  test "should destroy droid" do
    sign_in users(:rey)
    assert_difference('Droid.count', -1) do
      delete droid_url(@droid)
    end
    
    assert_redirected_to droids_url
  end
end
