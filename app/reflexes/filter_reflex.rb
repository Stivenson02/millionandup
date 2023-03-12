# frozen_string_literal: true

class FilterReflex < ApplicationReflex
  def apply_filter
    service = ProductsApiService.new.call
    products = service[:status] == ProductsApiService::SUCCESS ? @products = service[:response][:data] : []
    case element[:data_filter_id]
    when "for_name"
      products = products.sort_by { |val| val[:title] }
    when "for_price"
      products = products.sort_by { |val| val[:price] }
    when "for_rang"
      return morph "#put_select_modal", render(Controllers::Home::Index::SectionFilter::ModalRang::Component.new)
    else
      products = products.sort_by { |val| [val[:title], val[:price]] }
    end

    return morph "#put_filters", render(::Controllers::Home::Index::Component.new(options: { products: products }))
  end

  def modal_off
    return morph "#modal_filter", ""
  end
end
