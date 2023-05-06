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
FactoryBot.define do
  model = ::TrolleyDetail
  factory_key = model.model_name.singular.to_sym
  factory factory_key, class: model do
    product_id { create(::Product.model_name.singular.to_sym).id }
    amount { 1 }
    trolley_id { create(::Trolley.model_name.singular.to_sym).id }
    price { Money.from_cents(2000, "USD") }
  end
end
