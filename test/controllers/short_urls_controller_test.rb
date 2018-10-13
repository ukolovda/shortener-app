require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase

  setup do
    @url = urls(:one)
  end
  
  should 'show' do
    get :show, params: {short_code: @url.shortened_code}
    assert_response :redirect
    assert_redirected_to @url.make_full_url
  end
  
end