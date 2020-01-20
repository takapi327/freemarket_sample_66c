class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.references :user,   null:false, foreign_key:true                     #ユーザーID
      t.string     :derivery                                                 #配達日
      t.string     :name,      null:false                                    #商品名
      t.integer    :status,    null:false, default: 0                        #商品の状態
      t.integer    :price,     null:false                                    #商品の価格
      t.integer    :burden,    null:false, default: 0                        #配送料
      t.text       :content,   null:false                                    #商品の詳細
      t.string     :day,       null:false                                    #配達日数
      t.references :buyer,     foreign_key:{to_table: :users}                #購入者情報
      t.references :seller,    foreign_key:{to_table: :users}                #売主情報

      t.timestamps
    end
  end
end
