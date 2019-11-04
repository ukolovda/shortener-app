require 'test_helper'

class SimpleUrlClicksControllerTest < ActionController::TestCase

  test 'should not get index unsigned' do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
    assert_nil assigns(:simple_urls)
  end

  test 'should get index' do
    signed_as :one do
      get :index
      assert_response :success
      assert_not_nil assigns(:simple_url_clicks)
    end
  end

  test 'should get index with simple_url_id' do
    signed_as :one do
      get :index, params: {simple_url_id: simple_urls(:one).id}
      assert_response :success
      assert_not_nil assigns(:simple_url_clicks)
    end
  end

  test 'should get index with dates' do
    signed_as :one do
      get :index, params: {begin_date: '2019-10-31', end_date: '2019-10-31'}
      assert_response :success
      assert_not_nil assigns(:simple_url_clicks)
    end
  end

  test 'should get index csv' do
    signed_as :one do
      get :index, format: :csv
      assert_response :success
      assert_not_nil assigns(:simple_url_clicks)
    end
  end

end
