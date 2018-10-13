require 'test_helper'

class KeywordTest < ActiveSupport::TestCase
  test "inc_click_counter" do
    k = keywords(:one)
    k.inc_click_counter!
    # assert_equal 2, k.click_counter.click_count
    assert_equal 2, k.click_counter.reload.click_count
  end

  test "inc_click_counter if first" do
    ClickCounter.delete_all
    k = keywords(:one)
    assert_difference "ClickCounter.count" do
      k.inc_click_counter!
    end
    # assert_equal 2, k.click_counter.click_count
    assert_equal 1, k.click_counter.reload.click_count
  end
end
