class CreateClickCounters < ActiveRecord::Migration[5.2]
  def change
    create_table :click_counters do |t|
      t.bigint :keyword_id
      t.integer :click_count

      # t.timestamps

      t.index :keyword_id, unique: true
    end
  end
end
