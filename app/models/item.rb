class Item < ApplicationRecord
  belongs_to :trader
  belongs_to :product
  has_many :sales_logs
end
