class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.integer :product_id
      t.float :price

      t.timestamps
    end
  end
end
