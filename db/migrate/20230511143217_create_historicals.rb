class CreateHistoricals < ActiveRecord::Migration[7.0]
  def change
    create_table :historicals do |t|
      t.references :admin, null: false, foreign_key: { to_table: :admins }
      t.references :movement, polymorphic: true, null: false
      t.integer :change, null: false

      t.timestamps
    end
  end
end
