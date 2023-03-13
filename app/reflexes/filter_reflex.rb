# frozen_string_literal: true

class FilterReflex < ApplicationReflex
  def apply_filter
    products = Product.all
    case element[:data_filter_id]
    when "for_name"
      products = products.order(:title)
    when "for_price"
      products = products.order(:price_cents)
    when "for_rang"
      return morph "#put_select_modal", render(Controllers::Home::Index::SectionFilter::ModalRang::Component.new)
    else
      products = Product.order(:title, :price_cents)
    end

    return morph "#put_filters", render(::Controllers::Home::Index::Component.new(options: { products: products }))
  end

  def modal_off
    return morph "#modal_filter", ""
  end
end
