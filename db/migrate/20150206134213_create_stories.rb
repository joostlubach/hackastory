class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.string :source_url
      t.date :happened_on

      t.timestamps null: false
    end
  end
end
