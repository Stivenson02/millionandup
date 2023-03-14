# frozen_string_literal: true

class TrolleyReflex < ApplicationReflex

  def add_product
    product = Product.find(element[:data_product_id].to_i)
    trolley = TrolleyService.new(product: product).call
    t_count = 0
    trolley[:response][:data].trolley_details.each { |a| t_count = t_count + a.amount }
    return morph "#count_trolley", render(::Controllers::Home::Index::SectionTrolley::Component.new(options: { trolley_count: t_count }))
  end

  def delete_trolley_detail
    trolley_detail = TrolleyDetail.find(element[:data_trolley_detail_id].to_i)
    trolley = TrolleyService.new(trolley_detail: trolley_detail, type: :delete_product).call

    return close_modal_trolley if trolley[:status] == TrolleyService::FAILED || trolley[:response][:data].destroyed?
    return morph "#modal_trolley", render(::Controllers::Home::Index::SectionTrolley::ModalTrolley::Component.new(options: { trolley: trolley[:response][:data] }))
  end

  def show_modal_trolley
    trolley = Trolley.find_by(user_id: 0, status: :created)
    return morph "#modal_trolley", render(::Controllers::Home::Index::SectionTrolley::ModalTrolley::Component.new(options: { trolley: trolley }))
  end

  def close_modal_trolley
    return morph "#modal_trolley", ""
  end

  def checkout
    trolley = Trolley.find(element[:data_trolley_id].to_i)
    trolley.paid!
    return close_modal_trolley
  end
end
