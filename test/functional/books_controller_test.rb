require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    book = FactoryGirl.create(:book)
    get :show, {id: book.id}
    assert_response :success
  end

  test "should get edit" do
    book = FactoryGirl.create(:book)
    get :edit, {id: book.id}
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, { book: FactoryGirl.attributes_for(:book) }
    end
    assert_redirected_to books_path
  end

  test "should render new" do
    book = FactoryGirl.build(:book)
    book.title = ''

    assert_no_difference('Book.count') do
      post :create, { book: book.attributes }
    end
    assert_response :success
  end

  test "should update book" do
    book = FactoryGirl.create(:book)
    book_update = FactoryGirl.build(:book)
    book_update.title = 'New Title'

    put :update, { id: book.to_param, book: book_update }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should render edit" do
    book = FactoryGirl.create(:book)
    book_update = FactoryGirl.build(:book)
    book_update.title = ''

    put :update, { id: book.to_param, book: book_update.attributes }
    assert_response :success
  end

  test "should destroy book" do
    book = FactoryGirl.create(:book)

    assert_difference('Book.count', -1) do
      delete :destroy, id: book.to_param
    end
    assert_redirected_to books_path
  end

end
