class CreateKeywords < ActiveRecord::Migration[5.2]
  def change
    create_table :keywords do |t|
      t.string :text, null: false
      t.integer :page, null: false, default: 1
      t.integer :weight, null: false, default: 10
      t.belongs_to :url, foreign_key: false, null: false

      t.timestamps
    end
  end
end
