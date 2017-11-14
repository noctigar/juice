class AddColumnsToSalesLogs < ActiveRecord::Migration[5.0]
  def change
    add_column :sales_logs, :sold_price, :integer, null: false, after: :product_id
  end
end
