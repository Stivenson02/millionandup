# frozen_string_literal: true

class HistoryReflex < ApplicationReflex

  def show_modal_history
    trolleys = Trolley.where(user_id: 0)
    return morph "#modal_history", render(::Controllers::Home::Index::SectionShoppingHistory::ModalHistory::Component.new(options: { trolleys: trolleys }))
  end

  def close_modal_history
    return morph "#modal_history", ""
  end

end
