require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book attributes must not be empty" do
    book = Book.new
    
    assert book.invalid?
    assert_equal "can't be blank", book.errors[:title].join('; ')
  end
end
