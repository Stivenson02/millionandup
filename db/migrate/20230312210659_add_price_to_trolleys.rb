class AddPriceToTrolleys < ActiveRecord::Migration[7.0]
  def change
    add_monetize :trolleys, :total
  end
end
