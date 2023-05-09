class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :discountPercentage, null: false
      t.string :thumbnail, null: false
      t.integer :stock, null: false
      t.references :creator, null: false, foreign_key: { to_table: :admins }
      t.timestamps
    end
  end
end
