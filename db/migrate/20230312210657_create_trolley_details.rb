class CreateTrolleyDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :trolley_details do |t|
      t.integer :product_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
