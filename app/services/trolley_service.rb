class TrolleyService

  require 'rest-client'
  attr_accessor :product, :trolley, :trolley_detail, :type, :user_ip, :user_login

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize(product: nil, user_ip: nil, user_login: nil, type: :add_product, trolley_detail: nil)
    self.product = product
    self.type = type
    self.trolley_detail = trolley_detail
    self.user_ip = user_ip
    self.user_login = user_login
  end

  def call
    set_trolley
    if [:add_product, :delete_product].include?(type)
      trolley.save! if trolley.new_record?
      begin
        ActiveRecord::Base.transaction do
          set_trolley_detail if trolley_detail.nil?
          add_product if type == :add_product
          delete_product if type == :delete_product
        end
      rescue => e
        { status: FAILED, response: { error: e.to_s } }
      end
    end

    edit_trolley if !trolley.nil? && trolley.trolley_details.count > 0
    { status: SUCCESS, response: { data: trolley, detail: trolley_detail } }
  end

  def set_trolley
    if !trolley_detail.nil?
      self.trolley = TrolleyDetail.find(trolley_detail.id).trolley
    elsif user_login.nil?
      self.trolley = Trolley.where(user_ip: user_ip, status: %i[created]).first_or_initialize
    else
      trolley_unificate unless user_login.nil?
      trolley_user = TrolleyUser.joins(:trolley).find_by(trolley: { status: %i[in_process] }, user_id: user_login)
      self.trolley = trolley_user&.trolley
    end
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

  def trolley_unificate
    trolley_user = TrolleyUser.joins(:trolley).find_by(trolley: { status: %i[in_process] }, user_id: user_login)
    trolley = Trolley.find_by(user_ip: user_ip, status: %i[created])
    if trolley_user.nil?
      unless trolley.nil?
        if trolley.trolley_user.nil?
          trolley_user = TrolleyUser.new(user_id: user_login, trolley: trolley)
          trolley_user.save!
          trolley.in_process!
        else
          trolley_dup = trolley.dup
          trolley_dup.save!
          trolley.trolley_details.each do |detail|
            detail_dup = detail.dup
            detail_dup.trolley = trolley_dup
            detail_dup.save!
          end
          trolley_user = TrolleyUser.new(user_id: user_login, trolley: trolley_dup)
          trolley_user.save!
          trolley_dup.in_process!
        end
      end
    else
      trolley_user.trolley.update!(user_ip: user_ip)
      unless trolley.nil?
        if trolley.trolley_user.nil?
          trolley.trolley_details.each do |detail|
            detail.update!(trolley: trolley_user.trolley)
          end
          trolley.delete
        end
      end
    end
  end

end
