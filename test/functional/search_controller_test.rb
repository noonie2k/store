require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "failed search should redirect to home" do
    post :perform, { search: 'Non existent book' }
    assert_redirected_to root_path
  end

  test "searching for an exising book by isbn redirects to the book" do
    book = FactoryGirl.create(:book)

    post :perform, { search: book.isbn }
    assert_redirected_to book
  end

  test "searching for an existing book by title redirects to the book" do
    book = FactoryGirl.create(:book)

    post :perform, { search: 'Book: ' + book.title }
    assert_redirected_to book
  end

  test "searching for an existing author by name redirects to the author" do
    author = FactoryGirl.create(:author)

    post :perform, { search: 'Author: ' + author.first_name + ' ' + author.last_name }
    assert_redirected_to author
  end
end
