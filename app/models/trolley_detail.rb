# == Schema Information
#
# Table name: trolley_details
#
#  id             :bigint           not null, primary key
#  product_id     :integer          not null
#  trolley_id     :integer          not null
#  amount         :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#
class TrolleyDetail < ApplicationRecord

  #===== Fields
  monetize :price_cents

  #===== Associations
  belongs_to :product

end
