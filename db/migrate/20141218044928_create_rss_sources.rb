class CreateRssSources < ActiveRecord::Migration
  def change
    create_table :rss_sources do |t|
      t.string :url
      t.string :title

      t.timestamps null: false
    end
  end
end
