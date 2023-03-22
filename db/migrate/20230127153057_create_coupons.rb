class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :discount_code
      t.string :description
      t.integer :amount

      t.timestamps
    end
  end
end
