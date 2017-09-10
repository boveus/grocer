class CreateGroceryIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :grocery_ingredients do |t|
      t.references :grocery_list, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
