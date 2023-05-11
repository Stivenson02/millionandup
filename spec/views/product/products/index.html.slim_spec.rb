require 'rails_helper'

RSpec.describe "product/products/index", type: :view do
  before(:each) do
    assign(:product_products, [
      Product::Product.create!(),
      Product::Product.create!()
    ])
  end

  it "renders a list of product/products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
