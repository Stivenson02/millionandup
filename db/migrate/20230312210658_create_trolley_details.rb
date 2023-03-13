class CreateTrolleyDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :trolley_details do |t|
      t.integer :amount, null: false
      t.timestamps
      t.references :trolley, null: false, foreign_key: { to_table: :trolleys }
      t.references :product, null: false, foreign_key: { to_table: :products }
    end
  end
end
