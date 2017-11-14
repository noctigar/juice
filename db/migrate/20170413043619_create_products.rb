class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :trader_id, null: false
      t.string :name,       null: false
      t.integer :price,      null: false
      t.integer :stock,     null: false
      t.boolean :hot,       default: false

      t.timestamps
    end
  end
end
