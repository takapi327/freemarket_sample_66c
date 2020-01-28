class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.references :user
      t.string :last_name, null: false
      t.string :first_name, null:false
      t.string :last_kana_name, null: false
      t.string :first_kana_name, null: false
      t.text :profile
      t.string :tel
      t.timestamps
    end
  end
end