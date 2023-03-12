class CreateTrolleys < ActiveRecord::Migration[7.0]
  def change
    create_table :trolleys do |t|
      t.integer :user_id, default: nil
      t.string :status, null: false
      t.timestamps
    end
  end
end
