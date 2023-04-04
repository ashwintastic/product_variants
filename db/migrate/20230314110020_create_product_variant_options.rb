class CreateProductVariantOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variant_options do |t|
      t.integer :product_variant_id
      t.string :option_value
      t.timestamps
    end
  end
end
