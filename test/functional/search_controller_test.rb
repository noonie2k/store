require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "failed search should redirect to home" do
    post :perform, { search: 'Non existent book' }
    assert_redirected_to root_path
  end

  test "searching for an exising book by isbn redirects to the book" do
    book = FactoryGirl.create(:book)

    post :perform, { search: book.isbn }
    assert_redirected_to book_path(book)
  end

  test "searching for an exising book by title redirects to the book" do
    book = FactoryGirl.create(:book)

    post :perform, { search: book.title }
    assert_redirected_to book_path(book)
  end
end
