require 'test_helper'

class ClickCounterTest < ActiveSupport::TestCase

  test "inc_counter" do
    c = click_counters(:one)
    assert_equal 1, c.click_count
    c.inc_counter!
    assert_equal 2, c.reload.click_count
  end

end
