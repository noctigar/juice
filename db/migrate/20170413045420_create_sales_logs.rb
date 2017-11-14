class CreateSalesLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :sales_logs do |t|
      t.integer :trader_id,   null: false
      t.integer :product_id,     null: false
      t.datetime :sold_at, null: false

      t.timestamps
    end
  end
end
