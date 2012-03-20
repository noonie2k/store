require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    author = FactoryGirl.create(:author)
    get :show, {id: author.id}
    assert_response :success
  end

  test "should get edit" do
    author = FactoryGirl.create(:author)
    get :edit, {id: author.id}
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
