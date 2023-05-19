# == Schema Information
#
# Table name: product_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  product_id  :bigint           not null
#
# Indexes
#
#  index_product_categories_on_category_id  (category_id)
#  index_product_categories_on_product_id   (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (product_id => products.id)
#
require 'rails_helper'

RSpec.describe Product::Category, type: :model do
  describe "fields" do
    it { should have_db_column(:category_id).of_type(:integer).with_options(null: false) }
    it { should have_db_column(:category_id).of_type(:integer).with_options(null: false) }
  end
end
