class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.bigint :category_id
      t.string :title
      t.bigint :price
      t.string :description

      t.timestamps
    end
  end
end
