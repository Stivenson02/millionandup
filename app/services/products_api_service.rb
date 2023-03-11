class ProductsApiService

  require 'rest-client'
  attr_accessor :products, :response

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize
    self.products = []
  end

  def call
    begin
      ActiveRecord::Base.transaction do
        response_dumy = RestClient.get('https://dummyjson.com/products')
        response_faker = RestClient.get('https://fakestoreapi.com/products')

        products_dumy = JSON.parse(response_dumy)["products"]
        products_faker = JSON.parse(response_faker)
        unify_products(products_dumy, products_faker)
      end
    rescue => e
      { status: FAILED, response: { error: e.to_s } }
    end
    { status: SUCCESS, response: { data: products } }
  end

  def unify_products(products_dumy, products_faker)
    products_dumy.each do |detail|

      self.products.push << {
        :id => products.count + 1,
        :title => detail["title"],
        :description => detail["description"],
        :price => Money.from_cents(detail["price"], "USD"),
        :discountPercentage => detail["discountPercentage"],
        :stock => detail["stock"],
        :category => detail["category"],
        :thumbnail => detail["thumbnail"]
      }
    end
    products_faker.each do |detail|
      self.products.push << {
        :id => products.count + 1,
        :title => detail["title"],
        :description => detail["description"],
        :price => Money.from_cents(detail["price"], "USD"),
        :discountPercentage => 0,
        :stock => detail["rating"]["count"],
        :category => detail["category"],
        :thumbnail => detail["image"]
      }
    end
  end
end
