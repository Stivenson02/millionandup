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
class Product < ApplicationRecord
  #===== Fields
  monetize :price_cents

  #===== Associations
  has_many :product_categories, class_name: Product::Category.name, foreign_key: :product_id
  belongs_to :creator, class_name: Admin.name

  def category
    self.product_categories.sample.category
  end


end
