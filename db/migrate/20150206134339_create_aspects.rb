class CreateAspects < ActiveRecord::Migration
  def change
    create_table :aspects do |t|
      t.references :story, index: true
      t.string :aspect, length: 10
      t.string :type, length: 50
      t.integer :order

      t.string :badge, limit: 10

      t.text   :text_content
      t.binary :binary_content

      t.timestamps null: false
    end
    add_foreign_key :aspects, :stories
  end
end
