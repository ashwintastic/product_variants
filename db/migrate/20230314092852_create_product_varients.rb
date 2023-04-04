class CreateProductVarients < ActiveRecord::Migration[7.0]
  def change
    create_table :product_varients do |t|
      t.integer :product_id
      t.integer :variant_id
      t.timestamps
    end
  end
end
