require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "author attributes must not be empty" do
    author = Author.new

    assert(author.invalid?, 'Author should have been invalid')
    assert_equal(["can't be blank"], author.errors[:first_name])
    assert_equal(["can't be blank"], author.errors[:last_name])
  end

  test "the string representation of the author should be the full name" do
    author = FactoryGirl.build :author

    assert_equal("First Last", author.to_s)
  end
end
