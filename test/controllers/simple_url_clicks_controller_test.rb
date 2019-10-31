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

  test 'should get index csv' do
    signed_as :one do
      get :index, format: :csv
      assert_response :success
      assert_not_nil assigns(:simple_url_clicks)
    end
  end

end
