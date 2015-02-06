class CreateUnlocks < ActiveRecord::Migration
  def change
    create_table :unlocks do |t|
      t.references :user, index: true
      t.references :aspect, index: true

      t.timestamps null: false
    end
    add_foreign_key :unlocks, :users
    add_foreign_key :unlocks, :aspects
  end
end
