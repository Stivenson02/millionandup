class CreateTrolleyUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :trolley_users do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :trolley, null: false, foreign_key: { to_table: :trolleys }

      t.timestamps
    end
  end
end
