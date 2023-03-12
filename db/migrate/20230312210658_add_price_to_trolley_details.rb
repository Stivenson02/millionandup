class AddPriceToTrolleyDetails < ActiveRecord::Migration[7.0]
  def change
    add_monetize :trolley_details, :price
  end
end
