class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :trader_id,  null: false
      t.integer :product_id, null: false

      t.timestamps
    end
  end
end
