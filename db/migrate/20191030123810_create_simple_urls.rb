class CreateSimpleUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :simple_urls do |t|
      t.references :user, constraint: false
      t.string :name
      t.string :alias
      t.string :url

      t.timestamps
    end
    add_index :simple_urls, [:user_id, :name], unique: true
    add_index :simple_urls, :alias, unique: true
  end
end
