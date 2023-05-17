class HomeController < ApplicationController

  before_action :set_products, only: [:index, :search]

  def index; end

  def search
    rang_min = params[:rang_min].to_i
    rang_max = params[:rang_max].to_i
    @products = Product.where(price_cents: (rang_min..rang_max)) if rang_min < rang_max
    respond_to do |format|
      format.turbo_stream { render :"home/products" }
    end
  end

  def set_products
    @products = Product.order(:updated_at, :price_cents).reverse
  end
end
