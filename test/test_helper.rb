require 'simplecov'
SimpleCov.coverage_dir('public/coverage')
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
