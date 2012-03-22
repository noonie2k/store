require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show" do
    user = FactoryGirl.create(:user)

    get(:show, { id: user.id })
    assert_response(:success)
  end

  test "should get new" do
    get(:new)
    assert_response(:success)
  end

  test "should create user" do
    assert_difference('User.count') do
      post(:create, { user: FactoryGirl.attributes_for(:user) })
    end
    user = User.last
    assert_equal(user.id, session[:user_id])
    assert_redirected_to(user)
  end

  test "should render new" do
    user = FactoryGirl.attributes_for(:user)
    user[:username] = ''

    assert_no_difference('User.count') do
      post(:create, { user: user })
    end
    assert_nil(session[:user_id])
    assert_response :success
  end
end
