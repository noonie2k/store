require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "new user registration" do
    user = FactoryGirl.attributes_for(:user)

    get(new_user_path)
    assert_response(:success)

    post_via_redirect(
      users_path,
      user: {
        username:              user[:username],
        name:                  user[:name],
        password:              user[:password],
        password_confirmation: user[:password_confirmation],
      }
    )

    user = User.last
    assert_equal(user_path(user), path)
    assert_equal('User successfully created', flash[:notice])
    assert_equal(user.id, session[:user_id])
  end
end
