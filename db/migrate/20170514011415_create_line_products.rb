class CreateLineProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :line_products do |t|
      t.string :quantity, default: 0
      t.integer :product_id
      t.integer :cart_id

      t.timestamps null: false

    end
  end
end
