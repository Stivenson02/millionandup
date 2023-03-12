class HomeController < ApplicationController

  before_action :set_products, only: [:index, :search]

  def index; end

  def search
    rang_min = params[:rang_min].to_i
    rang_max = params[:rang_max].to_i
    @products = @products.select { |product| product[:price].cents <= rang_max } unless rang_max == 0
    @products = @products.select { |product| product[:price].cents >= rang_min }
    respond_to do |format|
      format.turbo_stream { render :"home/products" }
    end
  end

  def set_products
    service = ProductsApiService.new.call
    @products = service[:response][:data].sort_by { |val| [val[:title], val[:price]] } if service[:status] == ProductsApiService::SUCCESS
  end
end
