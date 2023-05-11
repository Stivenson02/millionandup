require 'rails_helper'

RSpec.describe "product/products/show", type: :view do
  before(:each) do
    assign(:product_product, Product::Product.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
