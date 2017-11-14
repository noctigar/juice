class Product < ApplicationRecord
  belongs_to :trader
  has_one :item
end
