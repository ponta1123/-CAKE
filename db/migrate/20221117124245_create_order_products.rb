class CreateOrderProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :order_products do |t|
      t.integer :order_information_id, null: false
      t.integer :item_id, null: false
      t.integer :purchase_price, null: false
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
