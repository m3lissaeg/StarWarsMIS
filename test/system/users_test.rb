# Podrías crear un system test que valide que cuando llenas el formulario 
# de signup, el modelo de usuario quede creado con la información ingresada

require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:rey)
  end
  
  test "creating a User" do
    visit new_user_registration_path
    
    fill_in "Name", with: @user.name
    fill_in "Email", with: @user.email
    fill_in "Phone", with: @user.phone
    fill_in "Rank", with: @user.rank
    check 'user_jedi'
    check 'user_admin'
    fill_in "Password", with: "ThisIsaS4feP4$$"
    fill_in "Password confirmation", with: "ThisIsaS4feP4$$"
    click_on "Sign up"
    
    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal @user.name, User.order('id ASC').first.name
    assert_equal @user.email, User.order('id ASC').first.email
    assert_equal @user.phone, User.order('id ASC').first.phone
    assert_equal @user.rank, User.order('id ASC').first.rank
    assert_equal @user.jedi, User.order('id ASC').first.jedi
    assert_equal @user.admin, User.order('id ASC').first.admin
    
  end
  
end

