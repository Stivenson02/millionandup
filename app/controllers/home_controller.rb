class HomeController < ApplicationController

  before_action :set_products, only: [:index]

  def index ;end

  def set_products
    service = ProductsApiService.new.call
    @products = service[:response][:data] if service[:status] == ProductsApiService::SUCCESS

  end
end
