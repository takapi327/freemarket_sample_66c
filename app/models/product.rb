class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user
  has_many :categorys
  has_many :brands
  has_many :areas
  has_many :likes
  has_many :comments
  has_many :images
end
