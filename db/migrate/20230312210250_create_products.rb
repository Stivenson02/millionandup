class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :discountPercentage, null: false
      t.references :category, null: false, foreign_key: { to_table: :product_categories }
      t.string :thumbnail, null: false
      t.integer :stock, null: false
      t.timestamps
    end
  end
end
