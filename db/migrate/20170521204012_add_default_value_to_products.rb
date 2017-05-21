class AddDefaultValueToProducts < ActiveRecord::Migration[5.0]
  def change
      change_column :products, :price, :integer, default: 30
  end
end
