class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|

      t.references :product,   null:false,   foreign_key:true   #商品ID
      t.integer     :name,      null:false                       #カテゴリー名
 
      t.timestamps
    end
  end
end
