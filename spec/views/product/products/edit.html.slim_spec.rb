require 'rails_helper'

RSpec.describe "product/products/edit", type: :view do
  let(:product_product) {
    Product::Product.create!()
  }

  before(:each) do
    assign(:product_product, product_product)
  end

  it "renders the edit product_product form" do
    render

    assert_select "form[action=?][method=?]", product_product_path(product_product), "post" do
    end
  end
end
