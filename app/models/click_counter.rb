class ClickCounter < ApplicationRecord
  belongs_to :keyword

  def inc_counter!
    # Use raw SQL, to exclude race conditions
    self.class.connection.execute "UPDATE #{self.class.table_name} SET click_count = click_count+1 WHERE id=#{self.id} RETURNING click_count"
    # puts cnt.inspect
  end

end
