require 'simplecov'
SimpleCov.coverage_dir('public/coverage')
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# Included in functional tests, this module allows mocking of a logged in user
module CanLoginUser
  def login_user(user_to_login = :user)
    user = FactoryGirl.build(user_to_login)
    user.id = 1
    User.stubs(:find).returns(user)

    user
  end
end