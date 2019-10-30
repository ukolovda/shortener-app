require 'test_helper'

class ShortUrlsControllerTest < ActionController::TestCase

  should 'show by url' do
    url = urls(:one)
    ClickCounter.any_instance.expects(:inc_counter!)
    get :show, params: {short_code: url.shortened_code}
    assert_response :redirect
    # assert_redirected_to @url.make_full_url
  end
  
  should 'show by simple_url' do
    # ClickCounter.any_instance.expects(:inc_counter!)
    get :show, params: {short_code: 's123'}
    assert_response :redirect
    assert_redirected_to 'https://amazon.com/1'
  end

end
