class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.bigint :category_id
      t.bigint :min_price
      t.bigint :max_price

      t.timestamps
    end
  end
end
