class ProductsApiService

  require 'rest-client'
  attr_accessor :products, :response, :apis

  RETURNS = [
    SUCCESS = :success,
    FAILED = :failed
  ].freeze

  def initialize
    self.apis = [
      { url: 'https://dummyjson.com/products', object: "products",
        fields: {
          title: "title",
          description: "description",
          price: "price",
          discountPercentage: "discountPercentage",
          stock: "stock",
          category: "category",
          thumbnail: "thumbnail"
        } },
      { url: 'https://fakestoreapi.com/products', object: nil,
        fields: {
          title: "title",
          description: "description",
          price: "price",
          discountPercentage: nil,
          stock: nil,
          category: "category",
          thumbnail: "image"
        } },

    ]
  end

  def call
    begin
      apis.each do |api|
        self.response = RestClient.get(api[:url])
        add_products(api) unless response.nil?
        self.response = nil
      end
    rescue => e
      { status: FAILED, response: { error: e.to_s } }
    end

    { status: SUCCESS, response: { data: Product.all } }
  end

  def add_products(api)
    products_dumy = api[:object].nil? ? JSON.parse(response) : JSON.parse(response)[api[:object]]

    products_dumy.each do |detail|
      category = Product::Category.where(name: detail[api[:fields][:category]]).first_or_initialize
      category.save! if category.new_record?
      product = Product.where(title: detail[api[:fields][:title]]).first_or_initialize
      if product.new_record?
        product.description = detail[api[:fields][:title]]
        product.price = Money.from_cents(detail[api[:fields][:price]], "USD")
        product.discountPercentage = api[:fields][:discountPercentage].nil? ? 0 : detail[api[:fields][:discountPercentage]]
        product.stock = api[:fields][:stock].nil? ? rand(10) : detail[api[:fields][:stock]]
        product.category = category
        product.thumbnail = detail[api[:fields][:thumbnail]]
        product.save!
      end
    end
  end
end
