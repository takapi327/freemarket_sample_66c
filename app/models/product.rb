class Product < ApplicationRecord

  #データベースに保存されなかった場合には、各自コメントアウトを行い確認してください。
  belongs_to :user, optional: true
  has_many :categories
  has_many :brands
  has_many :areas
  has_many :likes
  has_many :comments
  has_many :images
  validates :user_id, presence: true
  validates :price, presence: true
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :categories


  enum status:{
    "---":0,
     送料込み(出品者負担):1,着払い(購入者負担):2
  }
end
