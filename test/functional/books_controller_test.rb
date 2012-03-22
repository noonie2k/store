require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should display books for author" do
    author = FactoryGirl.create(:author)
    book = FactoryGirl.build(:book)
    book.author = author
    book.save

    get :index, { author: author.id }
    assert_response :success
  end

  test "should get show" do
    book = FactoryGirl.create(:book)
    get :show, { id: book.id }
    assert_response :success
  end

  test "should get edit" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)
    get :edit, { id: book.id }, { user_id: user.id }
    assert_response :success
  end

  test "should get new" do
    user = FactoryGirl.create(:user)
    get :new, {}, { user_id: user.id }
    assert_response :success
  end

  test "should create book" do
    user = FactoryGirl.create(:user)
    assert_difference('Book.count') do
      post :create, { book: FactoryGirl.attributes_for(:book) }, { user_id: user.id }
    end
    assert_redirected_to books_path
  end

  test "should render new" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.build(:book)
    book.title = ''

    assert_no_difference('Book.count') do
      post :create, { book: book.attributes }, { user_id: user.id }
    end
    assert_response :success
  end

  test "should update book" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)
    book_update = FactoryGirl.build(:book)
    book_update.title = 'New Title'

    put :update, { id: book.to_param, book: book_update }, { user_id: user.id }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should render edit" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)
    book_update = FactoryGirl.build(:book)
    book_update.title = ''

    put :update, { id: book.to_param, book: book_update.attributes }, { user_id: user.id }
    assert_response :success
  end

  test "should destroy book" do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)

    assert_difference('Book.count', -1) do
      delete :destroy, { id: book.to_param }, { user_id: user.id }
    end
    assert_redirected_to books_path
  end

end
