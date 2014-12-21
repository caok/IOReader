class AddEntryMapping < ActiveRecord::Migration
  def change
    create_table :entry_mappings, id: false do |t|
      t.belongs_to :user
      t.belongs_to :entry
      t.boolean :is_valid, default: true
      t.boolean :has_stared
    end

    add_index :entry_mappings, :user_id
    add_index :entry_mappings, :entry_id
  end
end
