require 'rails_helper'

RSpec.describe "product/categories/new", type: :view do
  before(:each) do
    assign(:product_category, Product::Category.new(
      name: "MyString"
    ))
  end

  it "renders new product_category form" do
    render

    assert_select "form[action=?][method=?]", product_categories_path, "post" do

      assert_select "input[name=?]", "product_category[name]"
    end
  end
end
