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

  test "should get create" do
  end

  test "should get update" do
  end

  test "should get destroy" do
  end

end
