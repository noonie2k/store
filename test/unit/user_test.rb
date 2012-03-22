require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    user = User.new

    assert(user.invalid?, 'User should have been invalid')
    assert_equal(["can't be blank"], user.errors[:username])
    assert_equal(["can't be blank"], user.errors[:name])
    assert_equal(["can't be blank"], user.errors[:password])
  end

  test "password and password_confirmation should match" do
    user = FactoryGirl.build(:user)
    user.password_confirmation = 'not secret'

    assert user.invalid?
    assert_equal ["doesn't match confirmation"], user.errors[:password]
  end

  test "usernames must be unique" do
    FactoryGirl.create(:user)
    user = FactoryGirl.build(:user)

    assert(user.invalid?, 'User should have been invalid')
    assert_equal(["has already been taken"], user.errors[:username])
  end
end
