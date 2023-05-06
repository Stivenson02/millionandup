require 'rails_helper'

RSpec.describe "product/categories/index", type: :view do
  before(:each) do
    assign(:product_categories, [
      Product::Category.create!(
        name: "Name"
      ),
      Product::Category.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of product/categories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
