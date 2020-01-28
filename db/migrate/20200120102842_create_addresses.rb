class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :zip, null: false
      t.integer :prefectures, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :bill
      t.string :landline
      t.timestamps
    end
  end
end
