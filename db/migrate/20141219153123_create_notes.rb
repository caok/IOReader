class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :entry, index: true
      t.references :user, index: true
      t.text :abstract
      t.text :comment
      t.string :position
      t.integer :color

      t.timestamps null: false
    end
    add_foreign_key :notes, :entries
    add_foreign_key :notes, :users
  end
end
