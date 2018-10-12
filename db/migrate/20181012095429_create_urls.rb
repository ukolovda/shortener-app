class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :name, null: false
      t.string :shortened_code, null: false, limit: 6
      t.string :url, null: false
      t.string :ref, null: false
      t.string :extra, null: false
      t.string :ie, default: 'UTF8'
      t.belongs_to :user, foreign_key: false, null: false

      t.timestamps

      t.index :shortened_code, unique: true
    end
  end
end
