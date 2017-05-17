class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state, default: "NJ"
      t.integer :zip
      t.integer :recipient_id

      t.timestamps null: false

    end
  end
end
