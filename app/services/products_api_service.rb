class ProductsApiService

  require 'rest-client'
  attr_accessor :products, :response, :filter

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize(filter: nil)
    self.filter = filter
  end

  def call
    begin
      self.response = RestClient.get('https://dummyjson.com/products')
      self.products = JSON.parse(response)["products"]
      apply_filter unless filter.nil?
    rescue => e
      { status: FAILED, response: { data: e.to_s } }
    end
    { status: SUCCESS, response: { data: products } }
  end

  def apply_filter
    binding.pry
  end
end