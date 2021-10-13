require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:rey)
  end

  test "visiting the index" do
    sign_in users(:rey)
    visit users_url
    assert_selector "h3", text: "Users in Star Wars MIS"
  end

  test "admin user visiting index" do
    sign_in users(:rey)
    visit users_url
    assert_selector "td", {count: users.count, text: "Show"}
  end
  
  test "creating a User" do
    sign_in users(:rey)
    visit new_user_path
    
    fill_in "Name", with: @user.name
    fill_in "Email", with: @user.email
    fill_in "Phone", with: @user.phone
    fill_in "Rank", with: @user.rank
    check 'user_jedi'
    check 'user_admin'
    fill_in "Password", with: "ThisIsaS4feP4$$"
    fill_in "Password confirmation", with: "ThisIsaS4feP4$$"
    click_on "Submit"
    
    # Info filled and saved by the user should be equal to what is stored in DB
    assert_equal @user.name, User.order('id ASC').first.name
    assert_equal @user.email, User.order('id ASC').first.email
    assert_equal @user.phone, User.order('id ASC').first.phone
    assert_equal @user.rank, User.order('id ASC').first.rank
    assert_equal @user.jedi, User.order('id ASC').first.jedi
    assert_equal @user.admin, User.order('id ASC').first.admin
    
  end
  
  test "updating a User" do
    sign_in users(:rey)
    visit users_url
    click_on "Edit", match: :first
    
    fill_in "Name", with: "New Name"
    fill_in "Phone", with: "1111111"
    fill_in "Rank", with: "rank"
    check 'user_jedi'
    check 'user_admin'
    fill_in "Password", with: "ThisIsaS4feP4$$123"
    fill_in "Password confirmation", with: "ThisIsaS4feP4$$123"
    click_on "Submit"
    # Info filled and saved by the user should be equal to what is stored in DB

    assert_equal "New Name", User.order('id ASC').first.name
    assert_equal "1111111", User.order('id ASC').first.phone
    assert_equal "rank", User.order('id ASC').first.rank
  end

end

