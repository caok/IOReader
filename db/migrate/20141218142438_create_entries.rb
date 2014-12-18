class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.text :summary
      t.datetime :published
      t.string :url
      t.string :entry_id
      t.string :categories
      t.integer :rss_source_id

      t.timestamps null: false
    end
  end
end
