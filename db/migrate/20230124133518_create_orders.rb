class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.decimal :subtotal
      t.decimal :total
      t.boolean :order_status

      t.timestamps
    end
  end
end
