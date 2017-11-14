class Trader < ApplicationRecord
  has_many :products
  has_many :items
  has_many :sales_logs
end
