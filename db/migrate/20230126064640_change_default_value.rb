class ChangeDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :order_status, :boolean, default: "active"
  end
end
