require 'test_helper'

class SimpleUrlsControllerTest < ActionController::TestCase

  setup do
    @simple_url = simple_urls(:one)
  end
  
  should 'not get index unsigned' do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
    assert_nil assigns(:simple_urls)
  end

  should 'get index' do
    signed_as :one do
      get :new
      assert_response :success
      assert_not_nil assigns(:simple_urls)
    end
  end

  should 'get show' do
    signed_as :one do
      get :show, params: {id: @simple_url}
      assert_response :success
      assert_not_nil assigns(:simple_url)
    end
  end

  should 'get new' do
    signed_as :one do
      get :new
      assert_response :success
      assert_not_nil assigns(:simple_url)
    end
  end

  should 'post create' do
    signed_as :one do
      assert_difference 'SimpleUrl.count' do
        post :create, params: {simple_url: {name: 'New simple_url',
                                            url: 'http://myurl.com/ref='
        }        }
        # puts assigns(:simple_url).errors.inspect
      end
      assert_response :redirect
      assert_redirected_to simple_urls_path
      assert_not_nil assigns(:simple_urls)
      assert_not_nil assigns(:simple_url)
      assert_not_nil assigns(:simple_url).alias
    end
  end

  should 'get edit' do
    signed_as :one do
      get :edit, params: {id: @simple_url.id}
      assert_response :success
      assert_not_nil assigns(:simple_url)
    end
  end

  should 'patch update' do
    old_code = @simple_url.alias
    signed_as :one do
      assert_no_difference 'SimpleUrl.count' do
        patch :update, params: {id: @simple_url.id, simple_url: {name: 'New URL', url: 'http://myurl.com/ref=', ref: 'p_', extra: '123', ie: 'UTF8'}}
        # puts assigns(:url).errors.inspect
      end
      assert_response :redirect
      assert_redirected_to simple_urls_path
      assert_not_nil assigns(:simple_urls)
      assert_not_nil assigns(:simple_url)
      assert_not_nil assigns(:simple_url).alias
    end
    assert_equal old_code, @simple_url.reload.alias
  end

  should 'destroy' do
    signed_as :one do
      assert_difference 'SimpleUrl.count', -1 do
        delete :destroy, params: {id: @simple_url.id}
      end
      assert_response :redirect
      assert_redirected_to simple_urls_path
      assert_not_nil assigns(:simple_url)
    end
  end

end
