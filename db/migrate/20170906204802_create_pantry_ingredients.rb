class CreatePantryIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :pantry_ingredients do |t|
      t.references :pantry, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
