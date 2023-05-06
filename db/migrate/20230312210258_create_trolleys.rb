class CreateTrolleys < ActiveRecord::Migration[7.0]
  def change
    create_table :trolleys do |t|
      t.string :user_ip, default: nil
      t.integer :status, null: false
      t.string :total, default: 0
      t.timestamps
    end
  end
end
