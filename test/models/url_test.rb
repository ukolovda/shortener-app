require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should validate_uniqueness_of(:shortened_code).scoped_to(:user_id)
  should validate_presence_of(:name)
  # should validate_presence_of(:shortened_code)
  should validate_presence_of(:url)
  should validate_presence_of(:ref)
  should validate_presence_of(:extra)
  should validate_presence_of(:ie)
  should validate_presence_of(:user_id)

  test 'generate shortened code' do
    url = users(:one).urls.new(url: 'htps://www.amazon.com/')
    url.generate_short_code
    assert_not_nil url.shortened_code
  end

  test 'create and save' do
    url = users(:one).urls.new(name: 'New URL', url: 'http://www.amazon.com/ref=', ref: 'p_', extra: '123', ie: 'UTF8')
    url.validate
    assert url.save
    assert_not_nil url.shortened_code
  end
end
