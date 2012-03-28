require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  include CanLoginUser

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    author = FactoryGirl.build(:author)
    Author.stubs(:find).returns(author)

    get :show, {}
    assert_response :success
  end

  test "should get edit" do
    user = login_user()

    author = FactoryGirl.build(:author)
    Author.stubs(:find).returns(author)

    get :edit, {}, { user_id: user.id }
    assert_response :success
  end

  test "should get new" do
    user = login_user()

    get :new, {}, { user_id: user.id }
    assert_response :success
  end

  test "should create author" do
    user = login_user()

    assert_difference('Author.count') do
      post :create, { author: FactoryGirl.attributes_for(:author) }, { user_id: user.id }
    end
  end

  test "should render new" do
    user = login_user()

    author = FactoryGirl.build(:author)
    author.first_name = ''

    assert_no_difference('Author.count') do
      post :create, { author: author.attributes }, { user_id: user.id }
    end
    assert_response :success
  end

  test "should update author" do
    user = login_user()

    author = FactoryGirl.create(:author)
    author_update = FactoryGirl.build(:author)
    author_update.first_name = 'Bob'

    put :update, { id: author.to_param, author: author_update }, { user_id: user.id }
    assert_redirected_to author_path(assigns(:author))
  end

  test "should render edit" do
    user = login_user()

    author = FactoryGirl.create(:author)
    author_update = FactoryGirl.build(:author)
    author_update.first_name = ''

    put :update, { id: author.to_param, author: author_update.attributes }, { user_id: user.id }
    assert_response :success
  end

  test "should destroy author" do
    user = login_user()
    
    author = FactoryGirl.create(:author)

    assert_difference('Author.count', -1) do
      delete :destroy, { id: author.to_param }, { user_id: user.id }
    end
    assert_redirected_to authors_path
  end

end
