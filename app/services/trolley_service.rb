class TrolleyService

  require 'rest-client'
  attr_accessor :product, :trolley, :trolley_detail

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize(product: nil)
    self.product = product
  end

  def call
    begin
      ActiveRecord::Base.transaction do
        set_trolley
        set_trolley_detail
        add_product
        edit_trolley
      end
    rescue => e
      { status: FAILED, response: { error: e.to_s } }
    end
    { status: SUCCESS, response: { data: trolley } }
  end

  def set_trolley
    self.trolley = Trolley.where(user_id: 0).first_or_initialize
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
      total= total + detail.price_cents
    end
    trolley.total = total
    trolley.save!
  end

end