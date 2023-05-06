class TrolleyService

  require 'rest-client'
  attr_accessor :product, :trolley, :trolley_detail, :type

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize(product: nil, type: :add_product, trolley_detail: nil)
    self.product = product
    self.type = type
    self.trolley_detail = trolley_detail
  end

  def call
    begin
      ActiveRecord::Base.transaction do
        set_trolley
        set_trolley_detail if trolley_detail.nil?
        add_product if type == :add_product
        delete_product if type == :delete_product
        edit_trolley if trolley.trolley_details.count > 0
      end
    rescue => e
      { status: FAILED, response: { error: e.to_s } }
    end
    { status: SUCCESS, response: { data: trolley, detail: trolley_detail } }
  end

  def set_trolley
    self.trolley = Trolley.where(user_ip: nil, status: %i[created in_process]).first_or_initialize
    trolley.save! if trolley.new_record?
  end

  def set_trolley_detail
    self.trolley_detail = TrolleyDetail.where(product_id: product.id, trolley_id: trolley.id).first_or_initialize

  end

  def add_product
    trolley_detail.assign_attributes(
      amount: trolley_detail.amount.to_i + 1,
      price: trolley_detail.price + product.price)
    trolley_detail.save!
  end

  def edit_trolley
    total = 0
    trolley.trolley_details.each do |detail|
      detail_total = detail.price_cents * detail.amount
      total = total + detail_total
    end
    trolley.total = total
    trolley.save!
  end

  def delete_product
    trolley_detail.amount -= 1
    trolley_detail.save!
    trolley_detail.destroy! if trolley_detail.amount <= 0
    trolley.reload
    trolley.destroy! if trolley.trolley_details.count == 0
  end

end
