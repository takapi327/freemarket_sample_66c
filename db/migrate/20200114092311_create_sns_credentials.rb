class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider, null: false, unique: true #sns企業名を保存する
      t.string :uid, null: false, unique: true #利用者識別用の番号を保存する
      t.references :user, foreign_key: true #ユーザとの紐付け用
      t.timestamps
    end
  end
end
