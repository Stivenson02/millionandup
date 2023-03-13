class CreateTrolleys < ActiveRecord::Migration[7.0]
  def change
    create_table :trolleys do |t|
      t.integer :user_id, default: 0
      t.string :status
      t.string :total, default: 0
      t.timestamps
    end
  end
end
