class CreateProductVarientOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_varient_options do |t|
      t.integer :product_varient_id
      t.integer :option_id
      t.timestamps
    end
  end
end
