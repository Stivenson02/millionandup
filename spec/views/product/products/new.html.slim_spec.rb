require 'rails_helper'

RSpec.describe "product/products/new", type: :view do
  before(:each) do
    assign(:product_product, Product::Product.new())
  end

  it "renders new product_product form" do
    render

    assert_select "form[action=?][method=?]", product_products_path, "post" do
    end
  end
end
