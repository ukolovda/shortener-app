require 'test_helper'

class UrlsControllerTest < ActionController::TestCase

  setup do
    @url = urls(:one)
  end
  
  should 'not get index unsigned' do
    get :index
    assert_response :redirect
    assert_redirected_to new_user_session_path
    assert_nil assigns(:urls)
  end

  should 'get index' do
    signed_as :one do
      get :new
      assert_response :success
      assert_not_nil assigns(:urls)
    end
  end

  should 'get new' do
    signed_as :one do
      get :new
      assert_response :success
      assert_not_nil assigns(:urls)
    end
  end

  should 'post create' do
    signed_as :one do
      assert_difference 'Url.count' do
        assert_difference 'Keyword.count' do
          post :create, params: {url: {name: 'New URL', url: 'http://myurl.com/ref=', ref: 'p_', extra: '123', ie: 'UTF8',
                                       keywords_attributes: {'1'=>{text: 'k1', page: 1, weight: 10}}}}
          # puts assigns(:url).errors.inspect
        end
      end
      assert_response :redirect
      assert_redirected_to urls_path
      assert_not_nil assigns(:urls)
      assert_not_nil assigns(:url)
      assert_not_nil assigns(:url).shortened_code
    end
  end

  should 'get edit' do
    signed_as :one do
      get :edit, params: {id: @url.id}
      assert_response :success
      assert_not_nil assigns(:urls)
    end
  end

  should 'patch update' do
    old_code = @url.shortened_code
    signed_as :one do
      assert_no_difference 'Url.count' do
        patch :update, params: {id: @url.id, url: {name: 'New URL', url: 'http://myurl.com/ref=', ref: 'p_', extra: '123', ie: 'UTF8'}}
        # puts assigns(:url).errors.inspect
      end
      assert_response :redirect
      assert_redirected_to urls_path
      assert_not_nil assigns(:urls)
      assert_not_nil assigns(:url)
      assert_not_nil assigns(:url).shortened_code
    end
    assert_equal old_code, @url.reload.shortened_code
  end

  should 'destroy' do
    signed_as :one do
      assert_difference 'Url.count', -1 do
        assert_difference 'Keyword.count', -2 do
          delete :destroy, params: {id: @url.id}
        end
      end
      assert_response :redirect
      assert_redirected_to urls_path
      assert_not_nil assigns(:urls)
    end
  end

end
