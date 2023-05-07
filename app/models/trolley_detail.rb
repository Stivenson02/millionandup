# == Schema Information
#
# Table name: trolley_details
#
#  id             :bigint           not null, primary key
#  amount         :integer          not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  product_id     :bigint           not null
#  trolley_id     :bigint           not null
#
# Indexes
#
#  index_trolley_details_on_product_id  (product_id)
#  index_trolley_details_on_trolley_id  (trolley_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (trolley_id => trolleys.id)
#
class TrolleyDetail < ApplicationRecord

  #===== Fields
  monetize :price_cents

  #===== Associations
  belongs_to :product
  belongs_to :trolley

end
