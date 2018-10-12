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

  test 'make_keywords_for_select' do
    keys = urls(:one).make_keywords_for_select
    assert_equal 10, keys.select{ |k| k.weight == 10 }.count
    assert_equal 20, keys.select{ |k| k.weight == 20 }.count
  end

  test 'find_keyword' do
    url = urls(:one)
    res = {1 => 0, 2 => 0}
    1000.times do
      res[url.find_keyword.page] += 1
    end
    # Вероятность
    assert res[1] < 400
    assert res[2] > 600
  end
  
  test 'make_full_url' do
    url = urls(:one)
    result = url.make_full_url
    assert_match %r{\Ahttps://amazon.com/ref=ref_[12]\?extra1Key[12]\+[12]&page=[12]&ie=UTF8&qid=\d{10}}, result
  end
end
