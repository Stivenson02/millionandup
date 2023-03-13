class Product < ApplicationRecord
  #===== Fields
  monetize :price_cents
end
