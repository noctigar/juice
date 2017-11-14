class SalesLog < ApplicationRecord
  belongs_to :trader
  belongs_to :product

  validates :trader_id, presence: true
  validates :product_id, presence: true
  validates :sold_at, presence: true
  validates :sold_price, presence: true
end
