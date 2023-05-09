# == Schema Information
#
# Table name: products
#
#  id                 :bigint           not null, primary key
#  description        :string           not null
#  discountPercentage :string           not null
#  price_cents        :integer          default(0), not null
#  price_currency     :string           default("USD"), not null
#  stock              :integer          not null
#  thumbnail          :string           not null
#  title              :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  creator_id         :bigint           not null
#
# Indexes
#
#  index_products_on_creator_id  (creator_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => admins.id)
#
FactoryBot.define do
  model = ::Product
  factory_key = model.model_name.singular.to_sym
  factory factory_key, class: model do
    title { "Test" }
    description { "Test" }
    discountPercentage { "0" }
    category { "Test" }
    thumbnail { "Test" }
    stock { 2 }
    price { Money.from_cents(2000, "USD") }
  end
end
