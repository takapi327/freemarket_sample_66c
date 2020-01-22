class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|

      t.references :product,   null:false,   foreign_key:true   #商品ID
      t.text       :image,     null:false                       #商品画像

      t.timestamps
    end
  end
end
