class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|

      t.references  :product,  null:false,   foreign_key:true   #商品ID
      t.string      :name,     null:false                       #配送元県名

      t.timestamps
    end
  end
end
