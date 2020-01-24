class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.references :user,   null:false, foreign_key:true                     #ユーザーID
      t.references :category,   null:false, foreign_key:true
      t.integer    :area_id,   null:false
      t.string     :derivery                                                 #配達日
      t.string     :name,      null:false                                    #商品名
      t.integer    :status_id,    null:false                       #商品の状態
      t.integer    :price,     null:false                                    #商品の価格
      t.integer    :burden_id,    null:false                    #配送料
      t.text       :content,   null:false                                    #商品の詳細

      t.string     :day_id,       null:false                                    #配達日数

      t.references :buyer,     foreign_key:{to_table: :users}                #購入者情報
      t.references :seller,    foreign_key:{to_table: :users}                #売主情報

      t.timestamps
    end
  end
end
