class Keyword < ApplicationRecord
  belongs_to :url
  has_one :click_counter

  def inc_click_counter!
    if click_counter
      click_counter.inc_counter!
    else
      make_click_counter!
    end
  end

  def make_click_counter!
    create_click_counter(click_count: 1)
  end
end
