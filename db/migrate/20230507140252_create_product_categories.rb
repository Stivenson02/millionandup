class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.references :category, null: false, foreign_key: { to_table: :categories }
      t.references :product, null: false, foreign_key: { to_table: :products }

      t.timestamps
    end
  end
end
