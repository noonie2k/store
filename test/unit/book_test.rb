require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test "book attributes must not be empty" do
    book = Book.new
    
    assert book.invalid?
    assert_equal ["can't be blank"], book.errors[:title]
    assert_equal ["can't be blank", "is invalid"], book.errors[:isbn]
  end

  test "isbn must be in the correct format" do
    book = FactoryGirl.build(:book)
    book.isbn = 'ABC'

    assert book.invalid?
    assert_equal ["is invalid"], book.errors[:isbn]
  end

  test "no two books should have the same isbn" do
    FactoryGirl.create(:book)
    book = FactoryGirl.build(:book)

    assert book.invalid?
    assert_equal ["has already been taken"], book.errors[:isbn]
  end
end
