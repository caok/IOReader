class AddSourceMapping < ActiveRecord::Migration
  def change
    create_table :source_mappings, id: false do |t|
      t.belongs_to :user
      t.belongs_to :rss_source
      t.boolean :is_valid, default: true
    end
    add_index :source_mappings, :user_id
    add_index :source_mappings, :rss_source_id
  end
end
