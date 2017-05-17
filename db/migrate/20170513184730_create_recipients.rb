class CreateRecipients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :message
      t.integer :mobile_number
      t.integer :user_id

      t.timestamps null: false

    end
  end
end
