require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should add user id to the session" do
    user = FactoryGirl.create(:user)

    assert_difference 'session.count' do
      post :create, { username: user.username, password: user.password }
    end
    assert_redirected_to root_path
  end

  test "should redirect to login path" do
    user = FactoryGirl.create(:user)

    post :create, { username: user.username, password: 'incorrect' }
    assert_redirected_to login_path
  end

  test "should remove user_id from the session" do
    user = FactoryGirl.create(:user)
    post :create, { username: user.username, password: user.password }

    assert_difference('session.count', -1) do
      get :destroy
    end
    assert_redirected_to root_path
  end

end
