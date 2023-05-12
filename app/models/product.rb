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
#
class Product < ApplicationRecord
  #===== Fields
  monetize :price_cents

  #===== Associations
  has_many :historicals, as: :movement
  has_many :product_categories, class_name: Product::Category.name, foreign_key: :product_id
  has_many_attached :pictures

  def category
    self.product_categories&.sample&.category
  end

  validates :description,
            :discountPercentage,
            :stock,
            :thumbnail,
            :title,
            presence: true
  validates :price_cents, numericality: { greater_than: 0, only_integer: true }

end
