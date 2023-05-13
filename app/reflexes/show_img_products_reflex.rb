class ShowImgProductsReflex < ApplicationReflex

  def show_modal_img
    product = Product.find(element[:data_product_id])
    return morph "#modal_img_product", render(::Controllers::Home::Index::SectionImgProduct::Component.new(options: { product: product }))
  end

  def modal_off
    return morph "#modal_img_product", ""
  end

end