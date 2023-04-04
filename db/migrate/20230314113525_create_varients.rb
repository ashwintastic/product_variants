class CreateVarients < ActiveRecord::Migration[7.0]
  def change
    create_table :varients do |t|
      t.string :name
      t.timestamps
    end
  end
end
