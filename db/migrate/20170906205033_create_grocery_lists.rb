class CreateGroceryLists < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_lists do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :list

      t.timestamps
    end
  end
end
