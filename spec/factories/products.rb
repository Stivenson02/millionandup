FactoryBot.define do
  model = ::Product
  factory_key = model.model_name.singular.to_sym
  factory factory_key, class: model do
    title { "Test" }
    description { "Test" }
    discountPercentage { "0" }
    category { "Test" }
    thumbnail { "Test" }
    stock { 2 }
    price { Money.from_cents(2000, "USD") }
  end
end
