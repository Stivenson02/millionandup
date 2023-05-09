# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord

  #===== Associations
  has_many :product_categories, class_name: Product::Category.name, foreign_key: :category_id

end
