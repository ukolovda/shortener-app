class CreateSimpleUrlClicks < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_url_clicks do |t|
      t.references :simple_url, foreign_key: false
      t.string :ip
      t.datetime :clicked_at, null: false
    end
  end
end
