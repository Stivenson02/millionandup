require 'rails_helper'

RSpec.describe "product/categories/show", type: :view do
  before(:each) do
    assign(:product_category, Product::Category.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
